# -*- coding: utf-8 -*-
require 'moneta'
require 'pathname'
require 'velibe/config'

module Velibe

  module KvStore
    include Config

    KV_DB = Moneta.new(:YAML, file: KV_PATH)
    FAV_KEY = 'favorites'

    def self.db
      KV_DB
    end

    def self.fav_key
      FAV_KEY
    end

    def self.token
      KV_DB['token']
    end

    def self.reset_favorite_stations(*new_stations)
      KV_DB[FAV_KEY] = new_stations.collect(&:to_i)
    end

    def self.favorite_stations
      KV_DB[FAV_KEY]
    end

    def self.add_favorite_station(*stations)
      fav = KV_DB[FAV_KEY]
      # TODO: handle setup
      # TODO: check existing station
      stations.collect(&:to_i).each do |station|
        fav.push(station) unless fav.include?(station)
        end
      KV_DB[FAV_KEY] = fav
    end

  end
end
