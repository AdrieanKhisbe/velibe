# -*- coding: utf-8 -*-

require 'fileutils'
require 'pathname'
require 'sqlite3'
require 'active_record'
require 'csv'
require 'velibe/db/models'

module Velibe

  module Database
    DB_NAME = '~/.velib.db' # TODO: more generic + config
    DB_PATH = Pathname.new(DB_NAME).expand_path # .to_s?
    DATA_CSV = '../../../data/Paris.csv'
    DATA_CSV_FILE = File.join(File.dirname(File.expand_path(__FILE__)), DATA_CSV)
    #  §see: http://stackoverflow.com/questions/7828066/accessing-files-packaged-into-a-ruby-gem

    def self.exist?
      DB_PATH.exist? # §check
    end

    def self.active_connect
      ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: DB_PATH.to_s
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
      return SQlite3::Database.new(DB_PATH.to_s)
      # §see:options
      # §maybe: delete?  [not that working?]
    end

    def self.prune
      FileUtils.rm(DB_PATH) if self.exist?
    end

    #
    def self.make_schema
      ActiveRecord::Schema.define do

        create_table :stations do |t|
          t.integer :number
          t.string :name
          t.string :address
          t.float :latitude
          t.float :longitude
          t.index :number # ¤note: must be declared before
        end

        create_table :statuses do |t|
          t.integer :station_id
          t.boolean :status
          t.integer :bike_stands
          t.integer :available_bikes
          t.integer :available_bike_stands
          t.timestamp :last_update
        end

        # §todo: create others

      end
    end

    def self.populate
      # MAYBE: Use fast cv
      # ¤see: stopwatch  > to bench creation. >> (but overkill since just one step operation)
      puts 'Populate Database from csv Station description'
      # ¤note: transaction for faster insert
      ActiveRecord::Base.transaction do
        CSV.foreach(DATA_CSV_FILE, headers: true, converters: :numeric) do |row|
          # §TODO: converter
          #  header_converters: :underscore -> tried but get: NoMethodError: undefined method `arity' for nil:NilClass
          Station.create(number: row['Number'], name: row['Name'], address: row['Address'],
                         latitude: row['Latitude'], longitude: row['Longitude'])
        end
      end
    end

  end
end
