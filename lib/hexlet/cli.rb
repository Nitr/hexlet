require 'thor'

module Hexlet
  class CLI < Thor
    desc "service", 'city'
    option :service, required: true
    def weather(city)
      puts Hexlet.weather(options[:service], city)
    end

    default_task :weather
  end
end
