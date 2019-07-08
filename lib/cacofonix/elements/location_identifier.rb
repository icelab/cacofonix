# coding: utf-8

class Cacofonix::LocationIdentifier < Cacofonix::Identifier
  xml_name "LocationIdentifier"
  onix_code_from_list :location_id_type, "LocationIDType", :list => 92
end


