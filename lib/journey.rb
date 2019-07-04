class Journey
  attr_reader :current_journey, :history

  PENALTY_FARE = 6
  DEFAULT_FARE = 1

  def initialize
    @current_journey = {}
    @history = []
  end

  def start(entry_station)
    @journey = false
    @entry_station = entry_station
    @current_journey[:entry_station] = entry_station
  end

  def end(exit_station)
    @journey = true
    @exit_station = exit_station
    @current_journey[:exit_station] = exit_station
    @history << @current_journey
    @current_journey = {}
  end

  def complete?
    @journey
  end

  def fare
    @entry_station? DEFAULT_FARE : PENALTY_FARE
    @exit_station? DEFAULT_FARE : PENALTY_FARE
  end
end
