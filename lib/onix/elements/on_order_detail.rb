# coding: utf-8

class ONIX::OnOrderDetail < ONIX::Element
  xml_name "OnOrderDetail"
  xml_accessor :on_order, :from => "OnOrder", :as => Integer
  onix_date_accessor :expected_date, "ExpectedDate"
end
