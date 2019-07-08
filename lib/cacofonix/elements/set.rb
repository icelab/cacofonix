# coding: utf-8

class Cacofonix::Set < Cacofonix::Element
  xml_name "Set"
  onix_composite :product_identifiers, Cacofonix::ProductIdentifier
  xml_accessor :title_of_set, :from => "TitleOfSet"
  onix_composite :titles, Cacofonix::Title
  xml_accessor :set_part_number, :from => "SetPartNumber"
  xml_accessor :set_part_title, :from => "SetPartTitle"
  xml_accessor :number_within_set, :from => "ItemNumberWithinSet"
  xml_accessor :level_sequence_number, :from => "LevelSequenceNumber"
  xml_accessor :set_item_title, :from => "SetItemTitle"
end
