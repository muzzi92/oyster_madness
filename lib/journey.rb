class Journey
  JOURNEY_COST = 1
  PENALTY_COST = 6
  attr_reader :entry_station, :exit_station

  def in_journey?
    @entry_station != nil
  end

  def touch_in(station)
    @entry_station = station.name
  end

  def touch_out(station)
    @exit_station = station.name
  end

  def fare
    @exit_station == nil || @entry_station == nil ? PENALTY_COST : JOURNEY_COST
  end

end
