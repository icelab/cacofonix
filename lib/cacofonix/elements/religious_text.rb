# coding: utf-8

class Cacofonix::ReligiousText < Cacofonix::Element
  xml_name "ReligiousText"
  onix_composite :bible, Cacofonix::Bible, :singular => true
  onix_code_from_list :religious_text_identifier, "ReligiousTextIdentifier", :list => 88
  onix_composite :religious_text_feature, Cacofonix::ReligiousTextFeature
end
