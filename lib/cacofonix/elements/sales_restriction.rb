# coding: utf-8

class Cacofonix::SalesRestriction < Cacofonix::Element
  xml_name "SalesRestriction"
  onix_code_from_list :sales_restriction_type, "SalesRestrictionType", :list => 71
  onix_composite :sales_outlets, Cacofonix::SalesOutlet
end
