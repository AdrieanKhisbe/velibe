# -*- coding: utf-8 -*-
require 'velibe/version'
require 'velibe/api_velib'
require 'velibe/station_status'
require 'velibe/db/database'
require 'velibe/db/models'

module Velibe

  # Default values > Move
  Favorites = [10035, 19003, 19004, 10031]

  # TODO: try catch network exception
  # TODO lazy singleton!!

  # §maybe: class CLI

  def self.print_stations(stations)
    stations = Favorites if stations.empty? or !stations
    puts "Velibe >> Stations #{stations.join(', ')}:"
    stations.each { |station| puts "        > #{ApiVelib.get_station(station)}" }
  end

  def self.print_stations_bis(stations)
    stations = Favorites if stations.empty? or !stations
    puts "Velibe >> Stations #{stations.join(', ')}:"
    ApiVelib.get_stations(stations) { |station| StationStatus.print_from_json(station, '        > ') }
  end
  # TODO: Bench both?

end