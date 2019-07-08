# coding: utf-8

class Cacofonix::ContentItem < Cacofonix::Element
  xml_name "ContentItem"
  xml_accessor :level_sequence_number, :from => "LevelSequenceNumber"
  onix_composite :text_item, Cacofonix::TextItem
  onix_composite :website, Cacofonix::Website
  xml_accessor :component_type_name, :from => "ComponentTypeName"
  xml_accessor :component_number, :from => "ComponentNumber"
  xml_accessor :distinctive_title, :from => "DistinctiveTitle"
  onix_composite :titles, Cacofonix::Title
  onix_composite :work_identifiers, Cacofonix::WorkIdentifier
  onix_composite :contributors, Cacofonix::Contributor
  xml_accessor :contributor_statement, :from => "ContributorStatement"
  onix_composite :subjects, Cacofonix::Subject
  onix_composite :person_as_subjects, Cacofonix::Contributor
  xml_accessor :corporate_body_as_subject, :from => "CorporateBodyAsSubject", :as => []
  xml_accessor :place_as_subject, :from => "PlaceAsSubject", :as => []
  onix_composite :other_texts, Cacofonix::OtherText
  onix_composite :media_files, Cacofonix::MediaFile
end
