require_relative 'journey'
class Oystercard
  MAX_CAPACITY = 90
  MIN_BALANCE = 1
  attr_reader :balance, :journey_list

  def initialize
    @balance = 0
    @journey_list = []
    @journey = Journey.new
  end

  def top_up(amount)
    fail "Balance full: cannot add #{amount}!" if (@balance + amount) >= MAX_CAPACITY
     @balance += amount
  end

  def touch_in(station)
    touch_in_card_checks
    @journey.entry_station = station
  end

  def touch_out(station)
    @journey.exit_station = station
    deduct(@journey.fare)
    @journey_list << @journey.add_to_journey_list
    @journey.entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def touch_in_card_checks
    fail "Balance not enough!" if @balance < MIN_BALANCE
  end
end
