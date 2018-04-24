class Oystercard
  MAX_CAPACITY = 90
  MIN_BALANCE = 1
  JOURNEY_COST = 1
  attr_reader :balance, :journey, :entry_station

  def initialize
    @balance = 0
    @journey = false
  end

  def top_up(amount)
    fail "Balance full: cannot add #{amount}!" if (@balance + amount) >= MAX_CAPACITY
     @balance += amount
  end

  def in_journey?
    @journey
  end

  def touch_in(station)
    @entry_station = station.name
    fail "Balance not enough!" if @balance < MIN_BALANCE
    @journey = true
  end

  def touch_out
    @journey = false
    deduct(JOURNEY_COST)
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
