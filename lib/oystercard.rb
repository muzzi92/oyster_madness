class Oystercard
  attr_reader :balance, :MAX_CAPACITY, :journey

  def initialize
    @balance = 0
    @MAX_CAPACITY = 90
  end

  def top_up(amount)
    fail "Balance full: cannot add #{amount}!" if (@balance + amount) >= @MAX_CAPACITY
     @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @journey
  end

  def touch_in
    @journey = true
  end

  def touch_out
    @journey = false
  end
end
