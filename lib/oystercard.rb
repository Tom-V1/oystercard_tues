class Oystercard

  attr_reader :balance

  MAXIMUM_BALANCE = 90
 
  def initialize
    @balance = 0
  end

  def top_up(money)
    fail 'Maximum balance of #{maximum_balance} exceeded' if balance_check(money)
    @balance += money
  end

  private 

  def balance_check(money)
    amount = @balance + money
    return true if amount > MAXIMUM_BALANCE
    false
end
end
