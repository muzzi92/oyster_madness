require 'oystercard'

describe Oystercard do

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
      puts amount
      subject.top_up(amount)
      expect{ subject.top_up 1 }.to raise_error "Balance full: cannot add!"
    end
  end
end
