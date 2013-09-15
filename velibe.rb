# -*- coding: utf-8 -*-
## My Velib Querier

require 'net/http'
require 'net/https' # pas nécessaire
require 'json'

station = 10035

## crée URL
uri = 'https://api.jcdecaux.com/vls/v1/stations'
uri << "/#{station}" if station
uri = URI.parse(uri)
params = { :contract => "paris",
  :apiKey => "c9ce7179fe009f45d27565e5de702fab6da12dcd" }
uri.query = URI.encode_www_form(params)

## Coonection HTTPS
http = Net::HTTP.new(uri.host, 443)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(uri.request_uri)

resp = http.request(request)

if resp.is_a?(Net::HTTPSuccess)
  puts resp.body
else
  p resp
  puts "Error"
end
