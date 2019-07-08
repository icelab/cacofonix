# coding: utf-8

class Cacofonix::SupplierIdentifier < Cacofonix::Identifier
  xml_name "SupplierIdentifier"
  onix_code_from_list :supplier_id_type, "SupplierIDType", :list => 92
end
