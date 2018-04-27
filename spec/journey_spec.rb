require 'journey'
require 'oystercard'

describe Journey do
  card = Oystercard.new
  let(:station) { double :station, name: :Bank }
  let(:station2) { double :station, name: :London_Bridge }

  describe '#in_journey' do
    it 'responds as true when touch in is true' do
      card.top_up(20)
      card.touch_in(station)
      expect(subject.in_journey?).to eq true
    end
    it 'responds as false when touch out' do
      expect(subject.in_journey?).to eq false
    end
  end

  describe '#touch_in' do
    it 'saves the station where touched in' do
      expect(card.touch_in(station)).to eq station
    end
  end

  describe '#touch_out' do
    it 'saves the station where touched out' do
      expect(card.touch_out(station2)).to eq station2
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
