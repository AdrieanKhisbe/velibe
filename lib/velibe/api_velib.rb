# -*- coding: utf-8 -*-
require 'http'
require 'json'

module Velibe
  class ApiVelib

    API_KEY = ENV['VELIBE_TOKEN'] || raise(Error, 'No token provided')

    API_HOST = 'https://api.jcdecaux.com'
    API_PARAM= { contract: 'paris', apiKey: API_KEY }
    API_BASE_URI = '/vls/v1/stations'

    def self.get_station(station_number)
      uri = "#{API_HOST}#{API_BASE_URI}/#{station_number}"
      response = HTTP.get(uri, params: API_PARAM)

      if response.code == 200
        data = JSON.parse(response, symbolize_names: true)
        return StationStatus.from_hash(data)
      else
        nil # TODO: maybe raise error! (and handle 404, and no internet)
      end
    end

   def self.get_stations(stations, &block)
     result = []
     HTTP.persistent(API_HOST) do |http|
       stations.each do |station_number|
         response = http.get("#{API_BASE_URI}/#{station_number}", params: API_PARAM)
         result << ( block ? block.call(response) : response)
       end
     end
     result
   end

  end
end
