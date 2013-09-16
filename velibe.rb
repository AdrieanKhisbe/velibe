# -*- coding: utf-8 -*-
## My Velib Querier

require 'net/http'
require 'net/https' # pas nécessaire
require 'json'

station = 10035

class ApiVelib

  def initialize
    @api = "https://api.jcdecaux.com"
    @params = { :contract => "paris",
      :apiKey => "c9ce7179fe009f45d27565e5de702fab6da12dcd" }
    @base_uri = URI.parse("#{@api}/vls/v1/stations")
    self.connect_api
  end


  def connect_api
    @http = Net::HTTP.new(@base_uri.host, 443)  # doit être parsée
    @http.use_ssl = true
    @http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    puts "Connected to APi"
  end


  public
  def get_station(station_number)
    ## récupère données
    uri = URI.parse("#{@base_uri}/#{station_number}")
    uri.query = URI.encode_www_form(@params)
    apirequest = Net::HTTP::Get.new(uri.request_uri)  ## bug
    resp = @http.request(apirequest)

    ## affiche station
    if resp.is_a?(Net::HTTPSuccess)
      data = JSON.parse(resp.body)
      ## print all:    data.each{|k,v| puts "#{k}: #{v}"}
      puts "Station #{data["name"].capitalize}:  #{data["available_bikes"]} Velo(s) libre(s) pour #{data["available_bike_stands"]} places libres"
    else
      puts "Damn ErrorOccured: #{resp}"
    end
  end
end


api = ApiVelib.new
api.get_station(station)
