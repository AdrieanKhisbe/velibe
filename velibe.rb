#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
## My Velib Querier

require_relative 'ApiVelib' # why?
require_relative 'Station'

API_KEY = "c9ce7179fe009f45d27565e5de702fab6da12dcd"

# Default values
stations = [10035, 19003, 19004, 10031]

## Main
api = ApiVelib.new
#todo: try catch network exception
# §tosingleton!!

if ARGV.length == 0
  puts "Station par défault:"  # see logging
else
  # §askif there is no better way?
  # maybe all in class method of Station.
  # qui aurait api et reste (atbleau vide défault)
  stations = ARGV
end


puts "Velibe >> Stations #{stations.join(", ")}:"
stations.each{ |sta| puts "        > #{api.get_station(sta)}" }
# garder sta àgauche du chevron?
