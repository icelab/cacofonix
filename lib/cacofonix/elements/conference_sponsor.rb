# coding: utf-8

class Cacofonix::ConferenceSponsor < Cacofonix::Element
  xml_name "ConferenceSponsor"
  onix_composite :conference_sponsor_identifiers, Cacofonix::ConferenceSponsorIdentifier
  xml_accessor :person_name, :from => "PersonName"
  xml_accessor :corporate_name, :from => "CorporateName"
end
