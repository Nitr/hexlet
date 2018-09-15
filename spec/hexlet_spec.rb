require 'hexlet'

describe Hexlet do

  # Geobase (with http mock)
  it do
    ip = '95.81.209.168'
    not_found_response =  load_fixture('not_found.xml')
    request = stub_request(:get, Hexlet::API_URL)
      .with(query: {ip: ip})
      .to_return(body: not_found_response)

    geoipbase = Hexlet.geobaseip(ip)

    is_asserted_by {
      geoipbase.city == nil
    }
  end

  it do
    ip = '95.81.209.168'
    found_response =  load_fixture('found.xml')
    request = stub_request(:get, Hexlet::API_URL)
      .with(query: {ip: ip})
      .to_return(body: found_response)
    geoipbase = Hexlet.geobaseip(ip)

    is_asserted_by {
      geoipbase.city == 'Чебоксары'
    }
  end

  # Geobase (with DI)
  it do
    ip = '95.81.209.168'
    not_found_response =  load_fixture('not_found.xml')
    httpclient = double("httpclient")
    allow(httpclient).to receive(:get_response).and_return(double(body: not_found_response))

    geoipbase = Hexlet.geobaseip(ip, httpclient)

    is_asserted_by {
      geoipbase.city == nil
    }
  end

  it do
    ip = '95.81.209.168'
    found_response =  load_fixture('found.xml')
    httpclient = double("httpclient")
    allow(httpclient).to receive(:get_response).and_return(double(body: found_response))

    geoipbase = Hexlet.geobaseip(ip, httpclient)

    is_asserted_by {
      geoipbase.city == 'Чебоксары'
    }
  end

  # Weather
  it do
    is_asserted_by {
      Hexlet.weather('ServiceOne', 'berlin') == 'ServiceOne berlin'
    }
  end

  it do
    is_asserted_by {
      Hexlet.weather('ServiceTwo', 'Чебоксары') == 'ServiceTwo Чебоксары'
    }
  end

  it do
    is_asserted_by {
      Hexlet.weather('UnknownService', 'Чебоксары') == 'ServiceOne Чебоксары'
    }
  end
end
