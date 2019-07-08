# coding: utf-8

require 'spec_helper.rb'

describe Cacofonix::Writer do

  before(:each) do
    @output = StringIO.new
  end

  it "should output the correct xml metadata" do
    header = Cacofonix::Header.new
    writer = Cacofonix::Writer.new(@output, header)
    writer.end_document

    lines = @output.string.split("\n")

    # xml declaration
    lines[0][0,5].should eql("<?xml")

    # doctype
    lines[1][0,9].should eql("<!DOCTYPE")
  end

  it "should output the correct xml metadata when used in block form" do
    header = Cacofonix::Header.new
    Cacofonix::Writer.open(@output, header) { |writer| }

    lines = @output.string.split("\n")

    # xml declaration
    lines[0][0,5].should eql("<?xml")

    # doctype
    lines[1][0,9].should eql("<!DOCTYPE")
  end

  it "should output the header node" do
    header = Cacofonix::Header.new

    Cacofonix::Writer.open(@output, header) { |writer| }

    lines = @output.string.split("\n")

    lines[3][0,7].should eql("<Header")
  end

  it "should output the product node" do
    header = Cacofonix::Header.new
    product = Cacofonix::Product.new

    Cacofonix::Writer.open(@output, header) do |writer|
      writer << product
    end

    lines = @output.string.split("\n")

    lines[4][0,8].should eql("<Product")
  end


  it "should output product nodes created and yielded by writer" do
    header = Cacofonix::Header.new
    Cacofonix::Writer.open(@output, header, :class => Cacofonix::APAProduct) do |writer|
      writer.product do |product|
        product.title = "Grimm's Fairy Tales"
        product.publication_date = Date.parse("2011-04-13")
      end
    end
    out = @output.string
    out.should include("<TitleText>Grimm's Fairy Tales</TitleText>")
    out.should include("<PublicationDate>20110413</PublicationDate>")
  end

  it "should output product nodes with interpretations" do
    Cacofonix::Writer.open(
      @output,
      Cacofonix::Header.new,
      :interpret => Cacofonix::SpecInterpretations::Setters
    ) do |writer|
      writer.product { |p| p.title = "Grimm's Fairy Tales" }
    end
    out = @output.string
    out.should include("<TitleText>Grimm's Fairy Tales</TitleText>")
  end

  it "should correctly store finished state" do
    header = Cacofonix::Header.new
    writer = Cacofonix::Writer.new(@output, header)
    writer.finished?.should be false
    writer.end_document
    writer.finished?.should be true
  end

=begin
  it "should convert non-ASCII chars to references when outputting as a string" do
    header = Cacofonix::Header.new
    header.from_person = "Hans Küng"
    Cacofonix::Writer.open(@output, header) { |writer| }

    @output.string.include?("K&#252;ng").should be true
  end
=end
end
