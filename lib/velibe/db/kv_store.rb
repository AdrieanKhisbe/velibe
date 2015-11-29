# -*- coding: utf-8 -*-
require 'moneta'

module Velibe

  module KvStore
    NAME = '~/.velib.yaml' # TODO: more generic
    PATH = Pathname.new(NAME).expand_path
    DB = Moneta.new(:YAML, file: PATH)

    FAV_KEY = 'favorites'

    def self.token
      DB['token']
    end

    def self.favorite_stations
      DB[FAV_KEY] || []
    end

    def self.add_favorite_station(*stations)
      fav = DB[FAV_KEY]
      stations.each { |station| fav.push(station) unless fav.include?(station) }
    end


  end
end
