require 'hexlet'

describe Hexlet do

  # Geobase
  it do
    ip = '95.81.209.168'
    request = stub_request(:get, Hexlet::API_URL)
      .with(query: {ip: ip})
      .to_return(body: load_fixture('found.xml'))

    Hexlet.geobaseip(ip)

    assert_requested request
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
