# coding: utf-8

class Cacofonix::SenderIdentifier < Cacofonix::Identifier
  xml_name "SenderIdentifier"
  onix_code_from_list :sender_id_type, "SenderIDType", :list => 44
end
