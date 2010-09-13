require 'active_support/core_ext/string/inflections'

module Finch
  class Angle
    class << self
      def inherited(subclass)
        Finch.angles += [subclass]
      end
      def key
        self.name.to_s[7..-6].underscore.to_sym
      end
    end

    attr_reader :source, :destination, :reservation

    def initialize(source, destination)
      @source, @destination = source, destination
    end

    def opinion
      0
    end

    def reservation
      @reservation || 0
    end

    private

    def reserve(num_ships)
      @reservation = self.reservation + num_ships
    end

    def reserve_conquering_fleet!
      reserve(@destination.num_ships)
    end
  end
end

Dir[File.dirname(__FILE__)+"/angles/*.rb"].each {|file| require file }