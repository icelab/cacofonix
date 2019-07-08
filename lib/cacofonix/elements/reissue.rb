# coding: utf-8

class Cacofonix::Reissue < Cacofonix::Element
  xml_name "Reissue"
  onix_date_accessor :reissue_date, "ReissueDate"
  xml_accessor :reissue_description, :from => "ReissueDescription"
  onix_composite :prices, Cacofonix::Price
  onix_composite :media_files, Cacofonix::MediaFile
end
