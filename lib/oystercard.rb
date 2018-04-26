class Oystercard
  MAX_CAPACITY = 90
  MIN_BALANCE = 1
  JOURNEY_COST = 1
  attr_reader :balance, :entry_station, :exit_station

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Balance full: cannot add #{amount}!" if (@balance + amount) >= MAX_CAPACITY
     @balance += amount
  end


  def touch_in(journey)
    touch_in_card_checks
    @entry_station = journey.entry_station
  end

  def touch_out(station)
    @exit_station = station
    deduct(JOURNEY_COST)
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def touch_in_card_checks
    fail "Balance not enough!" if @balance < MIN_BALANCE
  end
end
