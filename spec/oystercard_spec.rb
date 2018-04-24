require 'oystercard'

describe Oystercard do

  let(:station) { double :station, name: :Bank}

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

    it { is_expected.to respond_to(:touch_in).with(1).argument }
  end

  describe '#touch_out' do
    it 'in_journey returns false when touch out' do
      subject.top_up(10)
      subject.touch_in(station)
      subject.touch_out
      expect(subject.in_journey?).to eq false
    end

    it 'expects balance to be deducted on touch out' do
      subject.top_up(10)
      expect { subject.touch_out }.to change { subject.balance }.by(-Oystercard::JOURNEY_COST)
    end
  end

  describe '#entry_station' do
    it 'remembers the entry station on touch in' do
      subject.top_up(10)
      subject.touch_in(station)
      expect(subject.entry_station).to eq :Bank
    end

    it 'resets entry station to nil on touch out' do
      subject.top_up(10)
      subject.touch_in(station)
      subject.touch_out
      expect(subject.entry_station).to be_nil
    end
  end
end
