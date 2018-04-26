class Oystercard
  MAX_CAPACITY = 90
  MIN_BALANCE = 1
  attr_reader :balance, :entry_station, :exit_station, :journey_list

  def initialize
    @balance = 0
    @journey_list = []
  end

  def top_up(amount)
    fail "Balance full: cannot add #{amount}!" if (@balance + amount) >= MAX_CAPACITY
     @balance += amount
  end

  def touch_in(journey)
    touch_in_card_checks
    @entry_station = journey.entry_station
  end

  def touch_out(journey)
    @exit_station = journey.exit_station
    deduct(journey.fare)
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def add_to_journey_list
    @journey_list << { start: @entry_station, end: @exit_station }
  end

  def touch_in_card_checks
    fail "Balance not enough!" if @balance < MIN_BALANCE
  end
end
