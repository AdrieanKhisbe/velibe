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
  Favorites = tmp_fav.nil? ? [10035, 19003, 19004, 10031] : tmp_fav

  # TODO: try catch network exception
  # TODO lazy singleton!!

  # TODO extract cli class, and include!
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
    if Favorites.empty?
      puts 'No favorites so far, you can add some with `velibe favorite add <your> <number>`.'
    else
      puts "Favorites Stations: #{Favorites.join(', ')}"
    # TODO: print details with db
    end
  end

  # FIXME: text display from there
  def self.reset_favorites(force = false)
    KvStore.reset_favorite_stations if force or KvStore.favorite_stations.empty?
    # FIXME: ensure backup!! [store in history array]
  end

  def self.add_favorite(stations)
    KvStore.add_favorite_station *stations
  end

  def self.setup_station_database(force = false)
    Database.create if not Database.exist? or force
  end

end
