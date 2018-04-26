require 'pry'
require_relative 'oystercard.rb'
require_relative 'station.rb'
require_relative 'journey.rb'

journey = Journey.new
card = Oystercard.new
card.top_up(10)
bank = Station.new(:Bank, 1)
bridge = Station.new(:London_Bridge, 2)
