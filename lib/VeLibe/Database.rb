# -*- coding: utf-8 -*-

require 'pathname'
require 'sqlite3'

module Velibe

  module Database
    NAME = "~/.velib.db"
    PATH = Pathname.new(NAME).expand_path # .to_s?

    def self.exist?
      PATH.exist? # §check
    end

    def self.create
      SQlite3::Database.new(PATH.to_s) do |db|


    end

    def self.connexion
      SQlite3::Database.new(PATH.to_s)
      # §see:options


    end
# version block?


  end

end
