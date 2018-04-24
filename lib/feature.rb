require 'pry'
require_relative 'oystercard.rb'

card = Oystercard.new
card.top_up(10)
binding.pry
