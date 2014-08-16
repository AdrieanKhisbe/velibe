# -*- coding: utf-8 -*-

require 'fileutils'
require 'pathname'
require 'sqlite3'
require 'active_record'

module VeLibe

  module Database
    NAME = "~/.velib.db"
    PATH = Pathname.new(NAME).expand_path # .to_s?

    def self.exist?
      PATH.exist? # §check
    end

    def self.active_connect
      ActiveRecord::Base.establish_connection( adapter: 'sqlite3',
                                               database: PATH.to_s)

    end

    def self.create
      active_connect
      ActiveRecord::Schema.define do
        create_table :stations do |t|
          t.integer :number
          t.string  :name
          t.string  :address
          t.float   :latitude
          t.float   :longitude

          t.index   :number # ¤note: must be declared before

        end
        # crate others
      end

    end

    def self.connexion
      SQlite3::Database.new(PATH.to_s)
      # §see:options


    end
# version block?
    def self.prune
      #§later: check no connected?
      FileUtils.rm(PATH) if exist?
    end

  end

end
