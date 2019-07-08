# coding: utf-8

class Cacofonix::AgentIdentifier < Cacofonix::Element
  xml_name "AgentIdentifier"
  onix_code_from_list :agent_id_type, "AgentIDType", :list => 92
end
