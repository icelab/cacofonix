# coding: utf-8

require 'spec_helper.rb'

describe Cacofonix::SupplyDetail do

  before(:each) do
    load_doc_and_root("supply_detail.xml")
  end

  it "should correctly convert to a string" do
    sd = Cacofonix::SupplyDetail.from_xml(@root.to_s)
    sd.to_xml.to_s[0,14].should eql("<SupplyDetail>")
  end

  it "should provide read access to first level attributes" do
    sd = Cacofonix::SupplyDetail.from_xml(@root.to_s)

    sd.supplier_name.should eql("Rainbow Book Agencies")
    sd.product_availability.should eql(21)
    sd.stock.should be_a_kind_of(Array)
    sd.stock.size.should eql(1)
    sd.pack_quantity.should eql(16)
    sd.prices.should be_a_kind_of(Array)
    sd.prices.size.should eql(1)
  end

  it "should provide write access to first level attributes" do
    sd = Cacofonix::SupplyDetail.new

    sd.supplier_name = "RBA"
    sd.to_xml.to_s.include?("<SupplierName>RBA</SupplierName>").should be true

    sd.supplier_role = 1
    sd.to_xml.to_s.include?("<SupplierRole>01</SupplierRole>").should be true

    sd.availability_code = 2
    sd.to_xml.to_s.include?("<AvailabilityCode>02</AvailabilityCode>").should be true

    sd.product_availability = 3
    sd.to_xml.to_s.include?("<ProductAvailability>03</ProductAvailability>").should be true

    sd.pack_quantity = 12
    sd.to_xml.to_s.include?("<PackQuantity>12</PackQuantity>").should be true
  end

end

