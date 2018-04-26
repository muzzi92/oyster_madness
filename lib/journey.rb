class Journey
  attr_reader :journey_list, :entry_station

  def initialize
    @journey_list = []
  end

  def in_journey?
    @entry_station != nil
  end

  def touch_in(station)
    @entry_station = station.name
  end

  def add_to_journey_list(oystercard)
    @journey_list << { start: @entry_station, end: oystercard.exit_station }
  end

end
