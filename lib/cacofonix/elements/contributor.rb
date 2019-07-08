# coding: utf-8

class Cacofonix::Contributor < Cacofonix::NameBase
  xml_name "Contributor"
  xml_accessor :sequence_number, :from => "SequenceNumber", :as => Integer
  onix_code_from_list :contributor_role, "ContributorRole", :list => 17
  onix_code_from_list :language_code, "LanguageCode", :list => 74
  xml_accessor :sequence_number_within_role, :from => "SequenceNumberWithinRole", :as => Integer
  onix_composite :names, Cacofonix::Name
  onix_composite :person_dates, Cacofonix::PersonDate
  onix_composite :professional_affiliations, Cacofonix::ProfessionalAffiliation
  xml_accessor :corporate_name, :from => "CorporateName"
  xml_accessor :biographical_note, :from => "BiographicalNote"
  onix_composite :websites, Cacofonix::Website
  xml_accessor :contributor_description, :from => "ContributorDescription"
  onix_code_from_list :unnamed_persons, "UnnamedPersons", :list => 19
  onix_spaced_codes_from_list :country_codes, "CountryCode", :list => 91
  onix_spaced_codes_from_list :region_codes, "RegionCode", :list => 49
end
