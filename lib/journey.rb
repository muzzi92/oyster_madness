class Journey
  JOURNEY_COST = 1
  PENALTY_COST = 6
  attr_accessor :journey_list, :entry_station, :exit_station

  def in_journey?
    @entry_station != nil
  end
  
  def add_to_journey_list
    { start: @entry_station, end: @exit_station }
  end

  def fare
    @exit_station == nil || @entry_station == nil ? PENALTY_COST : JOURNEY_COST
  end

end
