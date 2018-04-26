require 'journey'

describe Journey do
  let(:station) { double :station, name: :Bank }
  let(:station2) { double :station, name: :London_Bridge }

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

  describe '#touch_out' do
    it 'saves the station where touched out' do
      expect(subject.touch_out(station2)).to eq :London_Bridge
    end
  end


  describe '#add_to_journey_list' do
    it 'expect journey list to eq hash' do
      subject.touch_in(station)
      entry_station = station.name
      subject.touch_out(station2)
      exit_station = station2.name
      expect(subject.add_to_journey_list).to eq [{start: :Bank, end: :London_Bridge}]
    end
  end

  describe '#fare' do
    it 'calculates journey fare if touch in and out' do
      subject.touch_in(station)
      subject.touch_out(station2)
      expect(subject.fare).to eq(Journey::JOURNEY_COST)
    end

    it 'charges a penalty if have not touched in' do
      subject.touch_out(station)
      expect(subject.fare).to eq(Journey::PENALTY_COST)
    end

    it 'charges a penalty if have not touched out' do
      subject.touch_in(station)
      expect(subject.fare).to eq(Journey::PENALTY_COST)
    end

  end

end
