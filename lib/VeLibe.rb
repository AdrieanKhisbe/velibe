# -*- coding: utf-8 -*-
require 'velibe/version'
require 'velibe/api_velib'
require 'velibe/station'
require 'velibe/database'
require 'velibe/models'

module Velibe

  # Default values > Move
  Favorites = [10035, 19003, 19004, 10031]

  Api = ApiVelib.new
  # TODO: try catch network exception
  # TODO lazy singleton!!

  # §maybe: class CLI

  def self.print_stations(stations)
    stations = Favorites if stations.empty? or !stations
    puts "Velibe >> Stations #{stations.join(', ')}:"
    stations.each{ |sta| puts "        > #{Api.get_station(sta)}" }
  end

end
