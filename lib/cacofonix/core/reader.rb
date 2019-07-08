# coding: utf-8

require 'stringio'
require "cacofonix/dtds"

module Cacofonix

  # This is the primary class for reading data from an ONIX file.
  #
  # Each ONIX file should contain a single header, and 1 or more products:
  #
  #   reader = Cacofonix::Reader.new("somefile.xml")
  #
  #   puts reader.header.inspect
  #
  #   reader.each do |product|
  #     puts product.inspect
  #   end
  #
  # The header will be returned as an Cacofonix::Header object, and the product will
  # be an Cacofonix::Product.
  #
  # The Cacofonix::Product class can be a bit of a hassle to work with, as data can
  # be nested in it fairly deeply. To wrap all the products returned by the
  # reader in a shim that provides simple accessor access to common attributes,
  # pass the shim class as a second argument.
  #
  #   reader = Cacofonix::Reader.new("somefile.xml", Cacofonix::APAProduct)
  #
  #   puts reader.header.inspect
  #
  #   reader.each do |product|
  #     puts product.inspect
  #   end
  #
  # APAProduct stands for Australian Publishers Association and provides simple
  # access to the ONIX attributes that are commonly used in the Australian
  # market.
  #
  # As well as accessing the file header, there are handful of other read only
  # attributes that might be useful
  #
  #   reader = Cacofonix::Reader.new("somefile.xml", Cacofonix::APAProduct)
  #
  #   puts reader.xml_lang
  #   puts reader.xml_version
  #
  # Note that ONIX has 1500 valid named entities (such as &ndash;) that can
  # cause the parser to throw an exception because it doesn't recognise them.
  # To work around this, the parser loads the ONIX DTD. It generally has to
  # do this over the internet, which slows parsing considerably. To skip DTD
  # loading (running the risk of parser exceptions), you can pass an option
  # to the constructor:
  #
  #   reader = Cacofonix::Reader.new("somefile.xml", Cacofonix::Product, :dtd => false)
  #
  # For more information, see http://is.gd/p7fHQq
  #
  class Reader
    include Enumerable

    attr_reader :header, :release
    attr_reader :xml_lang, :xml_version

    # Options:
    #
    #    :dtd - if false, then DTD is not loaded before parsing
    #    :interpret - a module (or an array of modules) that should extend
    #                 each Product
    #
    def initialize(input, product_klass = ::Cacofonix::Product, options = {})
      @input = input
      @product_klass = product_klass
      @options = options || {}

      create_parser

      @release = find_release
      @header = find_header

      @xml_lang    ||= @reader.lang
      @xml_version ||= @reader.xml_version.to_f
    end

    # Iterate over all the products in an ONIX file
    #
    def each(&block)
      @reader.each do |node|
        if @reader.node_type == 1 && @reader.name == "Product"
          str = @reader.outer_xml
          product = str.nil? ? @product_klass.new : @product_klass.from_xml(str)
          product.interpret @options[:interpret]
          yield product
        end
      end
    end

    # Assemble all the products in the ONIX file into an array. Obviously this
    # will chew through memory with very large ONIX files, so use with care.
    #
    def products
      @products ||= [].tap { |prods| each { |prod| prods << prod } }
    end

    # Rewind the reader so that you can call 'each' again.
    #
    def rewind
      create_parser
    end

    def close
      puts "Reader#close is deprecated."
    end

    private

    def create_parser
      Cacofonix::DTDs.apply_libxml_env!

      parser_config = lambda { |cfg|
        cfg.noent
        cfg.dtdload unless @options[:dtd] == false
      }
      if @input.kind_of?(String)
        @file   = File.open(@input, "r")
        @reader = Nokogiri::XML::Reader(@file, &parser_config)
      elsif @input.respond_to?(:read)
        @reader = Nokogiri::XML::Reader(@input, &parser_config)
      else
        raise ArgumentError, "Unable to read from file or IO stream"
      end
    end

    def find_release
      2.times do
        @reader.read
        if @reader.node_type == 1 && @reader.name == "ONIXMessage"
          value = @reader.attributes["release"]
          if value
            return BigDecimal(value)
          else
            return nil
          end
        elsif @reader.node_type == 14
          return nil
        end
      end
      return nil
    end

    def find_header
      100.times do
        @reader.read
        if @reader.node_type == 1 &&  @reader.name == "Header"
          str = @reader.outer_xml
          if str.nil?
            return Cacofonix::Header.new
          else
            return Cacofonix::Header.from_xml(str)
          end
        end
      end
      return nil
    end
  end
end
