class OysterCard
  attr_reader :balance, :entry_station
  DEFAULT_LIMIT = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    #@in_journey = false
  end

  def top_up(amount)
    raise 'Top-Up Limit Reached!' if @balance + amount  >= DEFAULT_LIMIT
    @balance += amount
  end


  def touch_in(entry_station)
    raise 'You have already tapped in!' if in_journey?
    raise 'You have insufficient funds' if min?
    #@in_journey = true
    @entry_station = entry_station
  end

  def touch_out
    raise 'You have not tapped in!' if !in_journey?
    deduct(MIN_BALANCE)
    @entry_station = nil
    in_journey?
  end

  def in_journey?
    if entry_station
      true
    else
      false
    end
  end

  private

  def deduct(amount)
   raise 'You have insufficient funds' if enough?(amount)
   @balance-=amount
   end

  def enough?(amount)
   @balance < amount
  end

  def min?
    @balance < MIN_BALANCE
  end
end
