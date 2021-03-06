# coding: utf-8

require 'spec_helper.rb'

describe Cacofonix::MarketRepresentation do

  before(:each) do
    load_doc_and_root("market_representation.xml")
  end

  it "should correctly convert to a string" do
    rep = Cacofonix::MarketRepresentation.from_xml(@root.to_s)
    rep.to_xml.to_s[0,22].should eql("<MarketRepresentation>")
  end

  it "should provide read access to first level attributes" do
    rep = Cacofonix::MarketRepresentation.from_xml(@root.to_s)

    rep.agent_name.should eql("Allen & Unwin")
    rep.agent_role.should eql(7)
  end

  it "should provide write access to first level attributes" do
    rep = Cacofonix::MarketRepresentation.new

    rep.agent_name = "Rainbow Book Agencies"
    rep.to_xml.to_s.include?("<AgentName>Rainbow Book Agencies</AgentName>").should be true

    rep.agent_role = 3
    rep.to_xml.to_s.include?("<AgentRole>03</AgentRole>").should be true

  end

end
