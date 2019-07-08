# coding: utf-8

require 'spec_helper.rb'

describe Cacofonix::Code, "instantiation" do

  it "should raise an error for an invalid codelist number" do
    lambda { Cacofonix::Code.new(500, 1) }.should raise_error(LoadError)
  end

  it "should find the codelist from a valid number" do
    Cacofonix::Code.new(1,1).list.should be_a_kind_of(Hash)
  end

  it "should turn all-digit string keys into integers" do
    Cacofonix::Code.new(1, "05").key.should eql(5)
    Cacofonix::Code.new(1, 5).key.should eql(5)
  end

  it "should not turn part-digit and no-digit keys into integers" do
    Cacofonix::Code.new(78, "P102").key.should eql("P102")
    Cacofonix::Code.new(66, "Y").key.should eql("Y")
  end

  it "should find the correct value for a key" do
    Cacofonix::Code.new(78, "D315").value.should eql("Nintendo Wii")
  end

  it "should find the correct key for a value" do
    Cacofonix::Code.new(78, "Nintendo Wii").key.should eql("D315")
  end

  it "should turn all-digit key into integer when found by value" do
    Cacofonix::Code.new(1, "Early notification").key.should eql(1)
  end

  it "should say code is invalid for an unmatched key or value" do
    Cacofonix::Code.new(1, 9999).valid?.should be false
    Cacofonix::Code.new(1, 1).valid?.should be true
  end

  it "should pad to_s output if initialised with integer key and length" do
    Cacofonix::Code.new(1, 1, :length => 2).to_s.should eql("01")
  end

end
