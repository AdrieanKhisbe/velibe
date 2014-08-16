require 'active_record'


module VeLibe
  module Models
    class Station < ActiveRecord::Base
      def self.find_by_number number
        self.find_by number: number
      end

    end
  end
end
