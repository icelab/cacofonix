# coding: utf-8

require 'spec_helper.rb'

describe Cacofonix::Publisher do

  before(:each) do
    load_doc_and_root("publisher.xml")
  end

  it "should correctly convert to a string" do
    pub = Cacofonix::Publisher.from_xml(@root.to_s)
    pub.to_xml.to_s[0,11].should eql("<Publisher>")
  end

  it "should provide read access to first level attributes" do
    pub = Cacofonix::Publisher.from_xml(@root.to_s)
    pub.publishing_role.should eql(1)
    pub.publisher_name.should eql("Desbooks Publishing")
  end

  it "should provide write access to first level attributes" do
    pub = Cacofonix::Publisher.new

    pub.publisher_name = "Paulist Press"
    pub.to_xml.to_s.include?("<PublisherName>Paulist Press</PublisherName>").should be true

    pub.publishing_role = 2
    pub.to_xml.to_s.include?("<PublishingRole>02</PublishingRole>").should be true
  end

end

