# coding: utf-8

class Cacofonix::CopyrightOwner < Cacofonix::Element
  xml_name "CopyrightOwner"
  onix_composite :copyright_owner_identifier, Cacofonix::CopyrightOwnerIdentifier, :singular => true
  xml_accessor :person_name, :from => "PersonName"
  xml_accessor :corporate_name, :from => "CorporateName"
end
