# coding: utf-8

class Cacofonix::Series < Cacofonix::Element
  xml_name "Series"
  onix_composite :series_identifiers, Cacofonix::SeriesIdentifier
  xml_accessor :title_of_series, :from => "TitleOfSeries"
  onix_composite :titles, Cacofonix::Title
  onix_composite :contributors, Cacofonix::Contributor
  xml_accessor :number_within_series, :from => "NumberWithinSeries"
  xml_accessor :year_of_annual, :from => "YearOfAnnual"
end
