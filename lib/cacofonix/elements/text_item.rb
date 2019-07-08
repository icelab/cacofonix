# coding: utf-8

class Cacofonix::TextItem < Cacofonix::Element
  xml_name "TextItem"
  onix_code_from_list :text_item_type, "TextItemType", :list => 42
  onix_composite :text_item_identifier, Cacofonix::TextItemIdentifier
  xml_accessor :first_page_number, :from => "FirstPageNumber"
  xml_accessor :last_page_number, :from => "LastPageNumber"
  onix_composite :page_runs, Cacofonix::PageRun
  xml_accessor :number_of_pages, :from => "NumberOfPages", :as => Integer
end
