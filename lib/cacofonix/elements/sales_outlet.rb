# coding: utf-8

class Cacofonix::SalesOutlet < Cacofonix::Element
  xml_name "SalesOutlet"
  onix_composite :sales_outlet_identifier, Cacofonix::SalesOutletIdentifier
  xml_accessor :sales_outlet_name, :from => "SalesOutletName"
end
