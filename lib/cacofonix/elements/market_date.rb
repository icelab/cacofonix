# coding: utf-8

class Cacofonix::MarketDate < Cacofonix::Element
  xml_name "MarketDate"
  onix_code_from_list :market_date_role, "MarketDateRole", :list => 67
  onix_code_from_list :date_format, "DateFormat", :list => 55
  onix_date_accessor :date, "Date"
end
