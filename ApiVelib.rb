# -*- coding: utf-8 -*-
require 'net/http'
require 'net/https' # pas nécessaire
require 'json'
# §todo logging

class ApiVelib
  def initialize
    @api = "https://api.jcdecaux.com"
    @params = { :contract => "paris",
      :apiKey => API_KEY }
    @base_uri = URI.parse("#{@api}/vls/v1/stations")
    self.connect_api
  end

  # private?
  def connect_api
    @http = Net::HTTP.new(@base_uri.host, 443)  # doit être parsée
    @http.use_ssl = true
    @http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    puts "Connected to VelibApi"
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
      data = JSON.parse(resp.body, symbolize_names: true)
      # puts data
      ## print all:    data.each{|k,v| puts "#{k}: #{v}"}
      return Station.new(data)
    else
      puts "Damn ErrorOccured: #{resp}"
      nil
    end
  end
end
