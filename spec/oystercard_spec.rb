require 'oystercard'

describe Oystercard do

  let(:station) { double :station, name: :Bank, zone: 1 }
  let(:station2) { double :station, name: :London_Bridge, zone: 2}

  describe '#balance' do
    it 'oystercard has default balance of zero' do
    expect(subject.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'adds top_up amount to balance' do
      amount = 5
      expect(subject.top_up(amount)).to eq subject.balance
    end

    it 'fails when balance of 90 is exceeded' do
      amount = described_class::MAX_CAPACITY
      expect{ subject.top_up(amount) }.to raise_error "Balance full: cannot add #{amount}!"
    end
  end

  describe '#in_journey' do
    it 'responds as true when touch in is true' do
      subject.top_up(5)
      subject.touch_in(station)
      expect(subject.in_journey?).to eq true
    end
  end

  describe '#touch_in' do
    it 'will not touch in if below minimum balance' do
      expect { subject.touch_in(station) }.to raise_error "Balance not enough!"
    end

    # it { is_expected.to respond_to(:touch_out).with(1).argument }
  end

  describe '#touch_out' do
    it 'in_journey returns false when touch out' do
      subject.top_up(10)
      subject.touch_in(station)
      subject.touch_out(station)
      expect(subject.in_journey?).to eq false
    end

    it 'expects balance to be deducted on touch out' do
      subject.top_up(10)
      subject.touch_in(station)
      expect { subject.touch_out(station) }.to change { subject.balance }.by(-Oystercard::JOURNEY_COST)
    end
  end

  describe '#exit_station' do
    it 'remember the exit station on touch out' do
      subject.top_up(10)
      subject.touch_in(station)
      subject.touch_out(station2)
      expect(subject.exit_station.name).to eq :London_Bridge
    end
  end

  describe '#entry_station' do
    it 'remembers the entry station on touch in' do
      subject.top_up(10)
      subject.touch_in(station)
      expect(subject.entry_station.name).to eq :Bank
    end

    it 'resets entry station to nil on touch out' do
      subject.top_up(10)
      subject.touch_in(station)
      subject.touch_out(station2)
      expect(subject.entry_station).to be_nil
    end
  end

  describe '#journey_list' do
    it 'checks if it returns an empty array' do
      expect(subject.journey_list).to eq []
    end
    it 'checks if journey_list contains one journey' do
      subject.top_up(10)
      subject.touch_in(station)
      subject.touch_out(station2)
      expect(subject.journey_list.size).to eq 1
    end
    it 'checks if journey_list contains a hash' do
      subject.top_up(10)
      subject.touch_in(station)
      subject.touch_out(station2)
      expect(subject.journey_list).to eq [{:start=>:Bank, :zone_start=>1, :end=>:London_Bridge, :zone_end=>2}]
    end
  end

end
