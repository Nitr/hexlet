require 'nokogiri'
require 'open-uri'

module Hexlet
  class Geobaseip
    API_URL = 'http://ipgeobase.ru:7020/geo'

    def initialize(ip)
      @ip = ip
    end

    def inetnum
      doc.xpath('//ip//inetnum').first.content
    end

    def country
      doc.xpath('//ip//country').first.content
    end

    def city
      doc.xpath('//ip//city').first.content
    end

    private

    def doc
      @request ||= Nokogiri.XML(open("http://ipgeobase.ru:7020/geo?ip=#{@ip}"))
    end
  end
end
