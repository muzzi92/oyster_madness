require 'pry'
require_relative 'oystercard.rb'
require_relative 'station.rb'

card = Oystercard.new
card.top_up(10)
bank = Station.new(:Bank, 1)
bridge = Station.new(:London_Bridge, 2)
binding.pry
card.touch_in(bank)
binding.pry
card.touch_out(bridge)
binding.pry
