class OysterCard
  attr_reader :balance, :in_journey
  DEFAULT_LIMIT = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise 'Top-Up Limit Reached!' if @balance + amount  >= DEFAULT_LIMIT
    @balance += amount
  end

  # def deduct(amount)
  #   raise 'You have insufficient funds' if enough?(amount)
  #   @balance-=amount
  # end

  def touch_in
    raise 'You have already tapped in!' if @in_journey == true
    raise 'You have insufficient funds' if min?
    @in_journey = true
  end

  def touch_out
    raise 'You have not tapped in!' if @in_journey == false
    @in_journey = false
  end

  private
  def enough?(amount)
    @balance < amount
  end

  def min?
    @balance < MIN_BALANCE
  end
end
