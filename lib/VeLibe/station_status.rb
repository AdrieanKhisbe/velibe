# -*- coding: utf-8 -*-

# §todo: new Station will go in module
# Todo: put in sub file?

class StationStatus
  attr_reader  :name, :available_bikes, :available_bike_stands

  def initialize (name, available_bikes, available_bike_stands)
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

  #  TODO rename
  def self.string_from_hash(json)
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

end
