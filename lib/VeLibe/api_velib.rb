# -*- coding: utf-8 -*-
require 'net/http'
require 'net/https' # pas nécessaire
require 'json'

# §todo logging 𝄞
# §todo: put in loggin.
# §see : singleton : require and include Singleton

class ApiVelib

  API_KEY = 'c9ce7179fe009f45d27565e5de702fab6da12dcd'
  # TODO -> in conf file or env (for public release.) (see framework)

  def initialize
    @api = 'https://api.jcdecaux.com'
    @params = {contract: 'paris', apiKey: API_KEY}
    @base_uri = URI.parse("#{@api}/vls/v1/stations")
    connect_api
    # Maybe: optional connect
  end


  public
  def get_station(station_number)
    ## récupère données
    uri = URI.parse("#{@base_uri}/#{station_number}") # voir autres adresses api fonction helper
    uri.query = URI.encode_www_form(@params)
    api_request = Net::HTTP::Get.new(uri.request_uri)  ## bug
    resp = @http.request(api_request)
    # §see: multirequest

    unless resp.is_a? Net::HTTPSuccess
      raise "Damn ErrorOccured: #{resp}"
    else
      data = JSON.parse(resp.body, symbolize_names: true)
      # puts data # log
      return Station.from_json(data)
    end
  end

  private
  def connect_api
    @http = Net::HTTP.new(@base_uri.host, 443)  # doit être parsée
    @http.use_ssl = true
    @http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    puts 'Connected to VelibApi' # log
  end

end
