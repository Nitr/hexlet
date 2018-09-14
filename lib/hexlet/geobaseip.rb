module Hexlet
  class Geobaseip
    def initialize(doc)
      @doc = doc
    end

    def inetnum
      @doc.xpath('//ip//inetnum').first.content
    end

    def country
      @doc.xpath('//ip//country').first.content
    end

    def city
      @doc.xpath('//ip//city').first.content
    end
  end
end
