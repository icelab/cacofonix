# coding: utf-8

class Cacofonix::Stock < Cacofonix::Element
  xml_name "Stock"
  onix_composite :location_identifier, Cacofonix::LocationIdentifier, :singular => true
  xml_accessor :location_name, :from => "LocationName"
  onix_composite :stock_quantity_coded, Cacofonix::StockQuantityCoded, :singular => true

  # NOTE: these *should* be numeric fields according to the spec,
  #       but heaps of ONIX files in the wild use text
  xml_accessor :on_hand, :from => "OnHand"
  xml_accessor :on_order, :from => "OnOrder"

  xml_accessor :cbo, :from => "CBO"
  onix_composite :on_order_detail, Cacofonix::OnOrderDetail, :singular => true
end
