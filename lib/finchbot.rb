require 'planetwars'
require 'active_support/core_ext/enumerable'

module Finch
  class << self
    attr_accessor :angles, :pw, :lookahead
    def angles
      @angles || []
    end
    require 'finchbot/angles'

    def lookahead
      @lookahead || 5
    end

    def parameter_count
      8
    end
  end

  class Bot
    attr_reader :parameters

    def initialize(parameters)
      @parameters = decode_parameters(parameters) if parameters.is_a?(Array)
      @parameters = parameters if parameters.is_a?(Hash)
    end

    def decode_parameters(ps)
      ps = ps.map(&:to_f)
      r = {:angle_weights => {:investment => ps[1], :attackable => ps[2], :defendable => ps[3], :defense_assist => ps[4], :crippling => ps[5], :incoming => ps[6], :battler => ps[7]}, :score_threshold => ps[0]}
      r[:total_weight] = r[:angle_weights].values.sum
      r
    end

    def angled_strategy
      moves = []
      Finch.pw.my_planets.each do |src|
        Finch.pw.planets.each do |dest|
          next if src == dest
          opinions = []
          reservation = 0
          Finch.angles.collect{|a| a.new(src,dest) }.each do |a|
            opinions.push((a.opinion || 0) * self.parameters[:angle_weights][a.class.key])
            reservation += a.reservation
          end
#          puts "comparing #{src.id} and #{dest.id}, gives #{opinions.join(" ")} => #{opinions.sum}"
          opinion = opinions.sum
          if(opinion > self.parameters[:score_threshold])
            moves.push({:source => src, :destination => dest, :score => opinion, :reservation => reservation})
          end
        end
        moves.sort_by {|m| m[:score]}
        moves.each do |move|
          ships = move[:reservation]
          if move[:source].num_ships < move[:reservation]
            ships = move[:source].num_ships - 1
          end
          Finch.pw.issue_order(move[:source], move[:destination], ships) if ships > 0
        end
      end
    end

    def naive_strategy(pw)
      # don't do anything if any of the following is true:
      # (1) we have more than three fleets in flight
      # (2) we don't have any planets left
      # (3) we have captured every planet
      return if pw.my_fleets.length >= 3
      return if pw.my_planets.length == 0
      return if pw.not_my_planets.length == 0

      # get a list of planets owned by me, sorted from weakest to strongest
      my_planets = pw.my_planets.sort_by {|x| x.num_ships }
      # get a list of planets that aren't mine, from strongest to weakest
      other_planets = pw.not_my_planets.sort_by {|x| 1.0/(1+x.num_ships) }
      debugger
      # send half of the ships from my weakest planet to my strongest one
      source = my_planets[-1]
      source_ships = my_planets[-1].num_ships
      dest = other_planets[-1]
      if source && dest
        num_ships = source_ships / 2
        pw.issue_order(source, dest, num_ships)
      end
    end

    def do_turn(pw)
      Finch.pw = pw
      #naive_strategy(pw)
      angled_strategy
      true
    end
  end
end
