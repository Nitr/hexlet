require 'hexlet'

describe Hexlet::Geobaseip do
  it do
    not_found_response =  Nokogiri.XML(load_fixture('not_found.xml'))
    geoipbase = Hexlet::Geobaseip.new(not_found_response)

    is_asserted_by {
      geoipbase.city == nil
    }
  end

  it do
    found_response =  Nokogiri.XML(load_fixture('found.xml'))
    geoipbase = Hexlet::Geobaseip.new(found_response)

    is_asserted_by {
      geoipbase.city == 'Чебоксары'
    }
  end
end
