require 'nokogiri'
require 'open-uri'
require "hexlet/version"
require 'hexlet/geobaseip'

module Hexlet
  API_URL = 'http://ipgeobase.ru:7020/geo'

  def self.geobaseip(ip)
    uri = URI(API_URL)
    uri.query = URI.encode_www_form(ip: ip)
    doc = Nokogiri.XML(open(uri))
    Geobaseip.new(doc)
  end
end
