#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
## My Velib Querier

require_relative 'ApiVelib' # why?
require_relative 'Station'

def_station = 10035
API_KEY = "c9ce7179fe009f45d27565e5de702fab6da12dcd"


## Main
api = ApiVelib.new
#todo: try catch network exception

if ARGV.length == 0
  puts "Station par défault:"  # see logging
  puts api.get_station(def_station)
else
  puts "Affichage des Stations #{ARGV.join(", ")}:"
  ARGV.each{|sta| puts api.get_station(sta)}
end
