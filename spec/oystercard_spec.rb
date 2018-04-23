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
end
