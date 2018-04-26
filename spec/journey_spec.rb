require 'journey'

describe Journey do
  let(:oystercard) {double :oystercard, entry_station: :Bank, zone_start: 1, exit_station: :London_Bridge, zone_end: 2 }
  let(:station) { double :station, name: :Bank }

  describe '#journey_list' do
    it 'checks if it returns an empty array' do
      expect(subject.journey_list).to eq []
    end
  end

  describe '#in_journey' do
    it 'responds as true when touch in is true' do
      subject.touch_in(station)
      entry_station = station.name
      expect(subject.in_journey?).to eq true
    end
    it 'responds as false when touch out' do
      expect(subject.in_journey?).to eq false
    end
  end

  describe '#touch_in' do
    it 'saves the station where touched in' do
      expect(subject.touch_in(station)).to eq :Bank
    end
  end


  describe '#add_to_journey_list' do
    it 'expect journey list to eq hash' do
      subject.touch_in(station)
      entry_station = station.name
      expect(subject.add_to_journey_list(oystercard)).to eq [{start: :Bank, end: :London_Bridge}]
    end
  end

end