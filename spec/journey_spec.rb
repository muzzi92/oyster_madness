require 'journey'

describe Journey do
  let(:oystercard) {double :oystercard, entry_station: :Bank, zone_start: 1, exit_station: :London_Bridge, zone_end: 2 }

  describe '#journey_list' do
    it 'checks if it returns an empty array' do
      expect(subject.journey_list).to eq []
    end
  end

  describe '#in_journey' do
    let(:oystercard2) {double :oystercard, entry_station: nil }
    it 'responds as true when touch in is true' do
      expect(subject.in_journey?(oystercard)).to eq true
    end
    it 'responds as false when touch out' do
      expect(subject.in_journey?(oystercard2)).to eq false
    end
  end

  describe '#add_to_journey_list' do
    it 'expect journey list to eq hash' do
      expect(subject.add_to_journey_list(oystercard)).to eq [{start: :Bank, zone_start: 1, end: :London_Bridge, zone_end: 2}]
    end
  end

end
