# coding: utf-8

class Cacofonix::BatchBonus < Cacofonix::Element
  xml_name "BatchBonus"
  xml_accessor :batch_quantity, :from => "BatchQuantity", :as => Integer
  xml_accessor :free_quantity, :from => "FreeQuantity", :as => Integer
end
