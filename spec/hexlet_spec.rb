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
    response = { "weather" => 'good'}
    http_client = double("http_client")
    custom_weather_service = double("CustomWeatherService")
    instace_custom_weather_service = instance_double("CustomWeatherService")

    allow(instace_custom_weather_service).to receive(:get_info).and_return('CustomWeatherService')
    allow(custom_weather_service).to receive(:new).with(http_client).and_return(instace_custom_weather_service)
    allow(http_client).to receive(:get).and_return(double(body:response.to_json))

    config = {
      http_client: http_client,
      services: {'CustomWeatherService' => custom_weather_service}
    }

    weather = Hexlet::Weather.new(config)

    is_asserted_by {
      weather.get_info('Чебоксары', 'CustomWeatherService') == 'CustomWeatherService'
    }

    is_asserted_by {
      weather.get_info('Чебоксары') == response
    }
  end
end
