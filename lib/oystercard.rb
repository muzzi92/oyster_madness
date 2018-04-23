class Oystercard
  attr_reader :balance

  def initialize
    @balance = 0
    @MAX_CAPACITY = 90
  end

  def top_up(amount)
    fail "Balance full!" if (@balance + amount) >= @MAX_CAPACITY
     @balance = @balance + amount
     # @balance
  end

end
