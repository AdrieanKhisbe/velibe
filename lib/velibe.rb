# -*- coding: utf-8 -*-
require 'velibe/version'
require 'velibe/api_velib'
require 'velibe/station_status'
require 'velibe/db/database'
require 'velibe/db/models'
require 'velibe/db/kv_store'

module Velibe

  # Default values > Move
  tmp_fav = KvStore.favorite_stations
  Favorites =  tmp_fav.empty? ? [10035, 19003, 19004, 10031] : tmp_fav

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



  def self.print_favorites
    puts "Favorites #{Favorites}"
  end

  def self.add_favorite(stations)
  puts stations
    KvStore.add_favorite_station(*stations)
  end


end
