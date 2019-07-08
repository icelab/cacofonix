# coding: utf-8

require 'forwardable'

module Cacofonix
  # super class for some simplified Cacofonix::Product wrappers
  class SimpleProduct

    def initialize(product = nil)
      @product = product || ::Cacofonix::Product.new
    end

    class << self

      include Forwardable

      def from_xml(xml)
        self.new(::Cacofonix::Product.from_xml(xml))
      end

      def parse_file(filename)
        self.new(::Cacofonix::Product.parse(File.read(filename)))
      end

      def parse(xml)
        self.new(::Cacofonix::Product.parse(xml))
      end

      protected

      def delegate(*args)
        def_delegators :@product, *args
      end
    end

    def product
      @product
    end

    def to_xml
      product.to_xml
    end

    delegate :interpret

    # TODO: add method missing magic to proxy through to the underlying product?

  end
end
