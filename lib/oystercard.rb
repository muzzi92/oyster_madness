class Oystercard
  MAX_CAPACITY = 90
  MIN_BALANCE = 1
  JOURNEY_COST = 1
  attr_reader :balance, :journey_list, :entry_station, :exit_station

  def initialize
    @journey_list = []
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
    touch_in_card_checks
    @entry_station = station
  end

  def touch_out(station)
    @exit_station = station
    deduct(JOURNEY_COST)
    add_to_journey_list
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def add_to_journey_list
    @journey_list << { start: @entry_station.name, zone_start: @entry_station.zone, end: @exit_station.name, zone_end: @exit_station.zone }
  end

  def touch_in_card_checks
    fail "Balance not enough!" if @balance < MIN_BALANCE
  end
end
