class Oystercard
  MAX_CAPACITY = 90
  MIN_BALANCE = 1
  JOURNEY_COST = 1
  attr_reader :balance, :entry_station

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Balance full: cannot add #{amount}!" if (@balance + amount) >= MAX_CAPACITY
     @balance += amount
  end

  def in_journey?
    @entry_station != nil
  end

  def touch_in(station)
    @entry_station = station.name
    fail "Balance not enough!" if @balance < MIN_BALANCE
  end

  def touch_out
    deduct(JOURNEY_COST)
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
