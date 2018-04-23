class Oystercard
  attr_reader :balance, :MAX_CAPACITY

  def initialize
    @balance = 0
    @MAX_CAPACITY = 90
  end

  def top_up(amount)
    fail "Balance full: cannot add #{amount}!" if (@balance + amount) >= @MAX_CAPACITY
     @balance = @balance + amount
  end

end
