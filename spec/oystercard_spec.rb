require 'oystercard'

describe Oystercard do

  describe '#balance' do
    it 'oystercard has default balance of zero' do
    expect(subject.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'respond to top_up' do
      expect(subject).to respond_to :top_up
    end

    it 'adds top_up amount to balance' do
      amount = 5
      expect(subject.top_up(amount)).to eq subject.balance
    end

    it 'fails when balance of 90 is exceeded' do
      amount = 91
      expect{ subject.top_up(amount) }.to raise_error "Balance full!"
    end

  end
end
