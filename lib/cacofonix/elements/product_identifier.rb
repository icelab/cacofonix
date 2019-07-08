# coding: utf-8

class Cacofonix::ProductIdentifier < Cacofonix::Identifier
  xml_name "ProductIdentifier"
  onix_code_from_list :product_id_type, "ProductIDType", :list => 5
end
