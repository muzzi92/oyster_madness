class Oystercard
  attr_reader :balance, :MAX_CAPACITY, :journey, :MIN_BALANCE

  def initialize
    @balance = 0
    @MAX_CAPACITY = 90
    @MIN_BALANCE = 1
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
    fail "Balance not enough!" if @balance < @MIN_BALANCE
    @journey = true
  end

  def touch_out
    @journey = false
  end
end
