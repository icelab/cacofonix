# coding: utf-8

require 'spec_helper.rb'

describe Cacofonix::NotForSale do

  before(:each) do
    load_doc_and_root("sales_rights.xml")
    @nfs = @root.at_css("NotForSale")
  end


  it "should correctly convert to a string" do
    rep = Cacofonix::NotForSale.from_xml(@nfs.to_s)
    rep.should produce_the_tag("<NotForSale>")
  end


  it "should provide read access to first level attributes" do
    p = Cacofonix::Product.from_xml(@root.to_s)
    p.not_for_sales[0].rights_countries.should eql(["GB"])
  end


  it "should provide write access to first level attributes" do
    nfs = Cacofonix::NotForSale.new
    nfs.rights_countries = ["GB", "US", "IE"]
    nfs.should include_the_xml("<RightsCountry>GB US IE</RightsCountry>")
  end

end
