# -*- coding: utf-8 -*-

require 'fileutils'
require 'pathname'
require 'sqlite3'
require 'active_record'
require 'csv'

module Velibe

  module Database
    NAME = '~/.velib.db' # TODO: more generic
    PATH = Pathname.new(NAME).expand_path # .to_s?
    DATA_CSV  = '../../data/Paris.csv'
    #  §see: http://stackoverflow.com/questions/7828066/accessing-files-packaged-into-a-ruby-gem

    def self.exist?
      PATH.exist? # §check
    end

    def self.active_connect
      ActiveRecord::Base.establish_connection(adapter: 'sqlite3',
                                              database: PATH.to_s)
    end

    def self.create
      active_connect
      make_schema
      populate
    end

    def self.create!
      prune
      create
    end

    def self.connexion
      return SQlite3::Database.new(PATH.to_s)
      # §see:options
      # §maybe: delete?  [not that working?]
    end
    # §todo: version block?

    def self.prune
      #§later: check no connected?
      FileUtils.rm(PATH) if exist?
    end

    #
    def self.make_schema
      ActiveRecord::Schema.define do

        create_table :stations do |t|
          t.integer :number
          t.string  :name
          t.string  :address
          t.float   :latitude
          t.float   :longitude
          t.index   :number # ¤note: must be declared before
        end

        create_table :statuses do |t|
          t.integer :station_id
          t.boolean :status
          t.integer  :bike_stands
          t.integer  :available_bikes
          t.integer  :available_bike_stands
          t.timestamp :last_update
          # t.timestamps
        end

        #§todo: create others

      end
    end

    def self.populate
      # MAYBE: Use fast cv
      csv_file =  File.join(File.dirname(File.expand_path(__FILE__)), DATA_CSV) # TODO: extract
      # ¤see: stopwatch  > ???
      puts 'Populate Database from csv Station description'
      # ¤note: transaction for faster insert
      ActiveRecord::Base.transaction do
        CSV.foreach(csv_file, headers: true, converters: :numeric) do |row|
          # §TODO: converter
          #  header_converters: :underscore -> tried but get: NoMethodError: undefined method `arity' for nil:NilClass
          Models::Station.create(number: row['Number'], name: row['Name'], address: row['Address'],
                                 latitude: row['Latitude'], longitude: row['Longitude'])
          # ¤note: inspect send back a hash
        end
      end
    end

  end
end
