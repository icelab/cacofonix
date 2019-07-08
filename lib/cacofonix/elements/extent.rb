# coding: utf-8

class Cacofonix::Extent < Cacofonix::Element
  xml_name "Extent"
  onix_code_from_list :extent_type, "ExtentType", :list => 23
  xml_accessor :extent_value, :from => "ExtentValue"
  onix_code_from_list :extent_unit, "ExtentUnit", :list => 24
end
