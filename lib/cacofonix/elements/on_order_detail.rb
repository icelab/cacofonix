# coding: utf-8

class Cacofonix::OnOrderDetail < Cacofonix::Element
  xml_name "OnOrderDetail"
  xml_accessor :on_order, :from => "OnOrder", :as => Integer
  onix_date_accessor :expected_date, "ExpectedDate"
end
