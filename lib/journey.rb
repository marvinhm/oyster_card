class Journey
  PENALTY_FARE = 6
  DEFAULT_FARE = 1

  def initialize
    @journey
    @fare = 0
  end

  def start(entry_station)
    @journey = false
    @entry_station = entry_station
  end

  def end(exit_station)
    @journey = true
    @exit_station = exit_station
  end

  def complete?
    @journey
  end

  def fare
    @entry_station? DEFAULT_FARE : PENALTY_FARE
    @exit_station? DEFAULT_FARE : PENALTY_FARE
  end
end
