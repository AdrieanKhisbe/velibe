# -*- coding: utf-8 -*-
require "VeLibe/version"
require 'VeLibe/ApiVelib'
require 'VeLibe/Station'
require 'VeLibe/Database'


module VeLibe

  # Default values
  Stations = [10035, 19003, 19004, 10031]
  Api = ApiVelib.new
  # todo: try catch network exception
  # §tosingleton!!
  # §maybe: inversion de controle? c'est station, initialisée avec le numéro
  # qui appelle l'api plutot que api qui controle station?
  # (rendrait transparent appel à station)
  # (méthode update & update!)

  # §maybe: class CLI

  def self.print_stations(stations = [])
    # §see: texst if param??
    if stations.empty?
    puts "Station par défault:"
    stations = Stations
    end

    puts "Velibe >> Stations #{stations.join(", ")}:"
    stations.each{ |sta| puts "        > #{Api.get_station(sta)}" }
  end
    # une version qui les renvoi?


end
