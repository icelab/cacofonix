# coding: utf-8

class Cacofonix::CopyrightStatement < Cacofonix::Element
  xml_name "CopyrightStatement"
  xml_accessor :copyright_years, :from => "CopyrightYear", :as => [Integer]
  onix_composite :copyright_owners, Cacofonix::CopyrightOwner
end
