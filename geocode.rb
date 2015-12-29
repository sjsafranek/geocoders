#!/usr/bin/env ruby

require 'net/http'
require 'uri'
require 'json'

uri = URI('http://geocoding.geo.census.gov/geocoder/locations/onelineaddress')
params = { 
    :address => ARGV[0],
    :format => "json", 
    :benchmark => 9 
}
uri.query = URI.encode_www_form(params)

res = Net::HTTP.get_response(uri)

if res.is_a?(Net::HTTPSuccess)
    data = JSON.parse(res.body)
    lon = data["result"]["addressMatches"][0]["coordinates"]["x"]
    lat = data["result"]["addressMatches"][0]["coordinates"]["y"]
    puts ARGV[0], lat, lon
end


# :address => "2225 Pierce St Eugene Or 97405", 
# http://geocoding.geo.census.gov/geocoder/Geocoding_Services_API.pdf

