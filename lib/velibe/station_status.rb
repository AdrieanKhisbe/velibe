# -*- coding: utf-8 -*-

module Velibe
  class StationStatus
    attr_reader :name, :available_bikes, :available_bike_stands

    def initialize (name, available_bikes, available_bike_stands)
      # Maybe: enhance with bike_stand, and last_update
      @name= name
      @available_bikes = available_bikes
      @available_bike_stands= available_bike_stands
      # TODO: creation Timestamp
    end

    def to_s
      "Station #{@name}:  #{@available_bikes} Velo(s) libre(s) pour #{@available_bike_stands} places libres"
    end

    def to_csv(sep = ';')
      [@name, @available_bikes, @available_bike_stands].join(sep)
    end

    # FIXME: replace comment with doc
    # TODO: maybe extract in Trajet: + method: velo dispo, stand dispo
    def can_leave?
      @available_bikes > 0 and not @available_bikes.nil? # test si nil quand pas de velo
    end

    # MAYBE REPLACE VALUE: 0 no, 1 un peu, 2 attention
    def can_go?
      @available_bike_stands > 0 and not @available_bike_stands # test si nil quand pas de velo
    end

    def can_go_to?(station)
      self.can_leave? and station.can_go?
    end

    def self.string_from_json(json)
      StationStatus.from_hash(json).to_s
    end

    def self.from_hash(json)
      # TODO: sanity check of jzon
      name = json[:name].capitalize #RAISE EROR if neede
      available_bikes = json[:available_bikes]
      available_bike_stands = json[:available_bike_stands]
      # T
      self.new(name, available_bikes, available_bike_stands)
    end

    # MAYBE Might belong in formater?
    def self.print_from_json(json_string, prefix='')
      data = JSON.parse(json_string, symbolize_names: true)
      status = StationStatus.from_hash(data)
      puts "#{prefix}#{status}"
      status
    end

  end

end
