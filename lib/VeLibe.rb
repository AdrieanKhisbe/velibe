# -*- coding: utf-8 -*-
require 'velibe/version'
require 'velibe/api_velib'
require 'velibe/station'
require 'velibe/database'
require 'velibe/models'

module Velibe

  # Default values
  Stations = [10035, 19003, 19004, 10031]

  Api = ApiVelib.new
  # TODO: try catch network exception
  # TODO lazy singleton!!

  # TODO > Old notes, to rethink
  # §maybe: inversion de controle? c'est station, initialisée avec le numéro
  # qui appelle l'api plutot que api qui controle station?
  # (rendrait transparent appel à station)
  # (méthode update & update!)

  # §maybe: class CLI

  def self.print_stations(stations = Stations)
    puts "Velibe >> Stations #{stations.join(", ")}:"
    stations.each{ |sta| puts "        > #{Api.get_station(sta)}" }
  end
    # une version qui les renvoi?

end
