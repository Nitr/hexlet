# Hexlet
### Usage
#### GeobaseIP
```
geobaseip = Hexlet.geobaseip('95.81.209.168')
geobaseip.city
geobaseip.country
```

#### Weather
```
weather = Hexlet::Weather.new(config)
weather.get_info('London') #=> use MetaWeather
weather.get_info('London', 'ServiceTwo')

config = {
  services: {'CustomWeatherService' => custom_weather_service}
}

weather = Hexlet::Weather.new(config)
weather.get_info('London', 'CustomWeatherService') #=> use CustomWeatherService

```
### Testing
```
bundle exec rspec
```
