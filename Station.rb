# -*- coding: utf-8 -*-

class Station
  attr_reader  :name, :available_bikes, :available_bike_stands
  # §later: geoloc
  def initialize (json)
    # TODO: sanity check of jzon
    @name = json[:name].capitalize # strange, don't accept symbol as key
    # ¤note: pas par défault, faut le demander au parser. ( :symbolize_names => true)
    # coud have both in rail with with_indifferent_access (HashWithIndifferentAccess)
    @available_bikes = json[:available_bikes]
    @available_bike_stands = json[:available_bike_stands]
  end

  def to_s
    "Station #{@name}:  #{@available_bikes} Velo(s) libre(s) pour #{@available_bike_stands} places libres"
  end

  def can_leave?
    @available_bikes > 0 && @available_bike # test si nil quand pas de velo
  end

  def can_go?
    @available_bikes_stands > 0 && @available_bike_stands # test si nil quand pas de velo
  end

  def can_go_to?(station)
    self.can_leave? && station.can_go?
  end

  # rename §keep?
  def self.string_for_json(json)
    Station.new(json).to_s
  end

end
