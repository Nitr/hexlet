require 'nokogiri'
require 'open-uri'
require "hexlet/version"
require 'hexlet/geobaseip'

module Hexlet
  def self.geobaseip(ip)
    doc = Nokogiri.XML(OpenURI.open_uri("http://ipgeobase.ru:7020/geo?ip=#{ip}"))
    Geobaseip.new(doc)
  end
end
