class Journey
  attr_reader :journey, :history

  PENALTY_FARE = 6
  DEFAULT_FARE = 1

  def initialize
    @journey
    @current_journey = {}
    @history = []
  end

  def start(entry_station)
    @journey = false
    @entry_station = entry_station
    @current_journey[:entry_station] = entry_station
  end

  def end(exit_station)
    @journey = true if completed?
    @exit_station = exit_station
    @current_journey[:exit_station] = exit_station
    @history << @current_journey
    @current_journey = {}
  end

  def completed?
   @current_journey[:entry_station] != nil
  end

  def fare
    @entry_station? DEFAULT_FARE : PENALTY_FARE
    @exit_station? DEFAULT_FARE : PENALTY_FARE
  end
end
