require 'oystercard'

describe Oystercard do

  it { is_expected.to respond_to(:deduct).with(1).argument }

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
      amount = subject.MAX_CAPACITY
      expect{ subject.top_up(amount) }.to raise_error "Balance full: cannot add #{amount}!"
    end
  end

  describe '#deduct' do
    it 'deducts amount from balance' do
      amount = 10
      expect(subject.deduct(amount)).to eq subject.balance
    end
  end

  describe '#in_journey' do
    it 'responds as true when touch in is true' do
      subject.touch_in
      expect(subject.in_journey?).to eq true
    end
  end

  describe '#touch_in' do
    it 'raises error if balance is 0' do
      balance = 0
      expect { subject.touch_in }.to raise_error "Balance not enough!"
    end
  end

  describe '#touch_out' do
    it 'in_journey returns false when touch out' do
      expect(subject.touch_out).to eq false
    end
  end
end
