# coding: utf-8

class Cacofonix::ContainedItem < Cacofonix::ProductBase
  xml_name "ContainedItem"
  xml_accessor :item_quantity, :from => "ItemQuantity", :as => Integer
end
