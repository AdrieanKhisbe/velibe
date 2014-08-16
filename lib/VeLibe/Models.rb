# -*- coding: utf-8 -*-
require 'active_record'


module VeLibe
  module Models
    class Station < ActiveRecord::Base
       has_many :status

      def self.find_by_number number
        self.find_by number: number
      end
      # §todo: get status

    end

    class Status < ActiveRecord::Base
      # todo: builder from json
      belongs_to :station

      def self.create_from_json json
        # maybe pass by the station?
        status = self.create({status: json[:status], #§todo
                               available_bikes: json[:available_bikes],
                               available_bike_stands: json[:available_bike_stands],
                               bike_stands: json[:bike_stands],
                               last_update: json[:last_update]}) #§see: convert
        status.station = Station.find_by_number(json[:number])
        # §todo: marshalize a data to reuse.
        # §todo: test way?
        status
      end
      # §maybe: delegate?

    end

    # > §later:favorite station: or store
    # nick name, and so on

  end
end
