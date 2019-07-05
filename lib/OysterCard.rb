require_relative 'journey'

class OysterCard
  attr_reader :balance, :entry_station, :history, :journey
  DEFAULT_LIMIT = 90
  MIN_BALANCE = 1

  def initialize(journey = Journey.new)
    @balance = 0
    @journey = journey
  end

  def top_up(amount)
    raise 'Top-Up Limit Reached!' if @balance + amount  >= DEFAULT_LIMIT
    @balance += amount
  end


  def touch_in(entry_station)
    @journey.start(entry_station)
    raise 'You have insufficient funds' if min?
    raise 'You have already tapped in!' if @journey.journey
  end

  def touch_out(exit_station)
    @journey.end(exit_station)
    raise 'You have not tapped in!' if !@journey.journey
    deduct(MIN_BALANCE)
  end

  def history
    @journey.history
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
