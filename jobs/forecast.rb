require 'net/http'
require 'uri'
require 'json'

SCHEDULER.every '5m', :first_in => 0 do |job|
  world_weather_online_api_key = '596e2effffd2491bbd9162905191406' # your api key here
  zip_code = "TW183AR"                # your zip code here

  uri = URI.parse(
    'http://api.worldweatheronline.com/premium/v1/weather.ashx' +
    "?key=#{world_weather_online_api_key}&q=#{zip_code}" +
    '&format=json'
  )

  response    = Net::HTTP.get(uri)
  forecast    = JSON.parse(response)['data']['current_condition'][0]
  description = forecast['weatherDesc'][0]['value']
  farenheit   = forecast['temp_C']
  code        = forecast['weatherCode']

  send_event('forecast', {
    farenheit: "#{farenheit}&deg;C",
    summary:   "#{description}",
    code:      "#{code}"
  })
end