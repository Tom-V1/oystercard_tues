class Oystercard

  attr_reader :balance

  MAXIMUM_BALANCE = 90

 
  def initialize
    @balance = 0
    @journey = false
  end

  def top_up(money)
    fail 'Maximum balance of #{maximum_balance} exceeded' if balance_check(money)
    @balance += money
  end

  def deduct(money)
    @balance -= money
  end

  def touch_in
    @journey = true
  end 

  def touch_out
    @journey = false
  end 

  def in_journey? 
    @journey 
  end

  private 

  def balance_check(money)
    amount = @balance + money
    return true if amount > MAXIMUM_BALANCE
    false
end
end
