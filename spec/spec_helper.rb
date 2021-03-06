# coding: utf-8

require "rubygems"
require "bundler"
Bundler.setup

require 'date'
require 'stringio'
require 'rubygems'
require 'cacofonix'


module Cacofonix::SpecHelpers

  def find_data_file(subpath)
    data_path = File.join(File.dirname(__FILE__), '..', 'data')
    File.join(data_path, subpath).tap { |fn|
      raise "File not found: #{fn}"  unless File.exists?(fn)
    }
  end

  def load_doc_and_root(subpath)
    fn = find_data_file(subpath)
    data = File.read(fn)
    @doc = Nokogiri::XML::Document.parse(data)
    @root = @doc.root
  end

end

include Cacofonix::SpecHelpers


# Simple example interpretations
#
module Cacofonix::SpecInterpretations
  module Getters
    def title
      titles.first.title_text.downcase
    end
  end

  module Setters
    def title=(str)
      composite = titles.first
      titles << composite = Cacofonix::Title.new  if composite.nil?
      composite.title_type = 1
      composite.title_text = str
    end
  end
end

RSpec.configure do |config|
  config.expect_with(:rspec) { |c| c.syntax = :should }
end


RSpec::Matchers.define(:produce_the_tag) do |expected|
  match do |actual|
    actual.to_xml.to_s[0, expected.size] == expected
  end
end

RSpec::Matchers.define(:include_the_xml) do |expected|
  match do |actual|
    actual.to_xml.to_s.include?(expected)
  end

  failure_message do |actual|
    "expected '#{actual.to_xml.to_s}' to include the xml '#{expected}'"
  end

  failure_message_when_negated do |actual|
    "expected '#{actual.to_xml.to_s}' not to include the xml '#{expected}'"
  end
end
