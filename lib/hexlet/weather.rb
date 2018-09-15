module Hexlet
  class Weather
    class ServiceOne
      def self.get_info(city)
        "ServiceOne #{city}"
      end
    end

    class ServiceTwo
      def self.get_info(city)
        "ServiceTwo #{city}"
      end
    end

    DefaultService = ServiceOne
    Services = {
      'ServiceOne' => ServiceOne,
      'ServiceTwo' => ServiceTwo
    }

    def self.lookup_service_for(service_name)
      Services[service_name] || DefaultService
    end

    def initialize(service)
      @service = service
    end

    def get_info(city)
      @service.get_info(city)
    end
  end
end
