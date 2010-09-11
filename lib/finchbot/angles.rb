require 'active_support/core_ext/string/inflections'

module Finch
  class Angle
    def self.inherited(subclass)
      Finch.angles += [subclass]
    end
    def self.key
      self.name.to_s[7..-6].underscore.to_sym
    end


    def opinion(source, destination, state)
      0
    end

  end
end

Dir[File.dirname(__FILE__)+"/angles/*.rb"].each {|file| require file }