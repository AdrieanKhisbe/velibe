# -*- coding: utf-8 -*-
require 'http'
require 'json'

module Velibe
  class ApiVelib

    API_KEY = 'c9ce7179fe009f45d27565e5de702fab6da12dcd'
    # TODO -> in conf file or env (for public release.) (see framework)

    API_ENDPOINT = 'https://api.jcdecaux.com'
    API_PARAM= {contract: 'paris', apiKey: API_KEY}
    API_BASE_URI = "#{API_ENDPOINT}/vls/v1/stations"

    def self.get_station(station_number)
      uri = "#{API_BASE_URI}/#{station_number}"
      response = HTTP.get(uri, params: API_PARAM)

      if response.code == 200
        data = JSON.parse(response, symbolize_names: true)
        return StationStatus.from_hash(data)
      else
        nil # TODO: maybe raise error! (and handle 404, and no internet)
      end
    end
   def self.get_stations()
   end

  end
end
