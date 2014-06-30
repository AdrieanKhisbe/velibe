#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
## My Velib Querier

require 'net/http'
require 'net/https' # pas nécessaire
require 'json'
require 'ApiVelib' # why?
require 'Station'

def_station = 1003
API_KEY = "c9ce7179fe009f45d27565e5de702fab6da12dcd"


## Main
api = ApiVelib.new
#todo: try catch network exception

if ARGV.length == 0
  puts "Station par défault:"
  api.get_station(def_station)
else
  puts "Affichage des Stations #{ARGV.join(", ")}:"
  ARGV.each{|sta| api.get_station(sta)}

end
