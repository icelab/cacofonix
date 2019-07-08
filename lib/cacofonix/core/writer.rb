# coding: utf-8

module Cacofonix
  # The primary way to write a new ONIX file.
  #
  # Here's a quick example. The generated file will be nice and boring, as the
  # header and product objects have no data in them, but you get the idea.
  #
  #   File.open("output.xml","w") do |output|
  #     header = Cacofonix::Header.new
  #     Cacofonix::Writer.open(output, header) do |writer|
  #       writer << Cacofonix::Product.new
  #       writer << Cacofonix::Product.new
  #     end
  #   end
  #
  # If you prefer, you can build your products using the APAProduct shim layer.
  #
  #   File.open("output.xml","w") do |output|
  #     header = Cacofonix::Header.new
  #     Cacofonix::Writer.open(output, header) do |writer|
  #       writer << Cacofonix::APAProduct.new
  #       writer << Cacofonix::APAProduct.new
  #     end
  #   end
  #
  # You can also have the writer build and yield the product to you:
  #
  #   Cacofonix::Writer.open(output, header, :class => Cacofonix::APAProduct) do |writer|
  #     writer.product do |product|
  #       product.title = "Grimm's Fairy Tales"
  #       product.publication_date = Date.today
  #     end
  #     writer.product do |product|
  #       product.title = "Telling the Truth"
  #       product.publication_date = Date.today - 7
  #     end
  #   end
  #
  #
  # ... which then allows you to use "interpretation modules":
  #
  #   module MySetters
  #     def set_publication_date_to_xmas
  #       self.publication_date = Date.parse("2001-12-25")
  #     end
  #   end
  #
  #   Cacofonix::Writer.open(output, header, :interpret => MySetters) do |writer|
  #     writer.product { |product| product.set_publication_date_to_xmas }
  #   end
  #
  #
  class Writer

    DOCTYPE = "http://www.editeur.org/onix/2.1/03/reference/onix-international.dtd"

    # Default constructor.
    def initialize(output, header, options = {})
      raise ArgumentError, 'msg must be an Cacofonix::Header object' unless header.kind_of?(Cacofonix::Header)
      @output = output
      @header = header
      @options = options
      @product_klass = @options[:class] || Cacofonix::Product
      @finished = false

      start_document
    end

    # deprecated
    def start_document
      puts "Cacofonix::StreamWriter#start_document is no longer required"
    end

    def << (product)
      unless product.kind_of?(Cacofonix::Product) || product.kind_of?(Cacofonix::SimpleProduct)
        raise ArgumentError, 'product must be an Cacofonix::Product or Cacofonix::SimpleProduct'
      end
      raise "Can't add products to a finished writer" if finished?

      @output.write(product.to_xml.to_s)
      @output.write("\n")
    end

    def product
      raise ArgumentError, "Block required"  unless block_given?
      product = @product_klass.new
      product.interpret @options[:interpret]
      yield product
      self << product
    end

    def end_document
      @output.write("</ONIXMessage>\n")
      @finished = true
    end

    def finished?
      @finished
    end

    def self.open(output, header, options = {})
      if block_given?
        writer = self.new(output, header, options)
        yield writer
        writer.end_document
      else
        self.new(output, header, options)
      end
    end

    private

    def start_document
      @output.write("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n")
      @output.write("<!DOCTYPE ONIXMessage SYSTEM \"#{DOCTYPE}\">\n")
      @output.write("<ONIXMessage release=\"2.1\">\n")
      @output.write(@header.to_xml.to_s)
      @output.write("\n")
    end

  end
end
