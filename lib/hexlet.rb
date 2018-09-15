require 'nokogiri'
require 'open-uri'
require "hexlet/version"
require 'hexlet/geobaseip'
require 'hexlet/Weather'

module Hexlet
  API_URL = 'http://ipgeobase.ru:7020/geo'

  def self.geobaseip(ip, httpclient = Net::HTTP)
    uri = URI(API_URL)
    uri.query = URI.encode_www_form(ip: ip)
    response = httpclient.get_response(uri)
    doc = Nokogiri.XML(response.body)

    Geobaseip.new(doc)
  end

  def self.weather(service_name, city)
    service = Hexlet::Weather.lookup_service_for(service_name)
    Hexlet::Weather.new(service).get_info(city)
  end
end
