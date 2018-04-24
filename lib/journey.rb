class Journey
  attr_reader :journey_list

  def initialize
    @journey_list = []
  end

  def in_journey?(oystercard)
    oystercard.entry_station != nil
  end

  def add_to_journey_list(oystercard)
    @journey_list << { start: oystercard.entry_station, zone_start: oystercard.zone_start, end: oystercard.exit_station, zone_end: oystercard.zone_end }
  end

end
