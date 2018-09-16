require 'json'
require 'httparty'
require 'byebug'

module Hexlet
  class Weather
    class MetaWeather
      API_SEARCH_URL = 'https://www.metaweather.com/api/location/search'

      def initialize(http_client = HTTParty)
        @http_client = http_client
      end

      def get_info(city)
        uri = URI(API_SEARCH_URL)
        uri.query = URI.encode_www_form(query: city)
        response = @http_client.get(uri)
        JSON.parse(response.body)
      end
    end

    class ServiceTwo
      def initialize(http_client = HTTParty)
        @http_client = http_client
      end

      def get_info(city)
        "ServiceTwo #{city}"
      end
    end

    DEFAULT_SERVICES = {
      'MetaWeather' => MetaWeather,
      'ServiceTwo' => ServiceTwo
    }

    DEFAULT_CONFIG = {
      http_client: HTTParty,
      services: []
    }

    def initialize(config = {})
      @config = DEFAULT_CONFIG.merge(config)
    end

    def get_info(city, service_name = 'MetaWeather')
      service = lookup_service(service_name)
      service.get_info(city)
    end

    private

    def lookup_service(service_name)
      services[service_name] || @service
    end

    def http_client
      @http_client ||= @config[:http_client]
    end

    def services
      @services ||= DEFAULT_SERVICES.
        merge(@config[:services]).
        each_with_object({}) { |(service_name, klass), hsh| hsh[service_name] = klass.new(http_client) }
    end
  end
end
