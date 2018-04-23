require 'oystercard'

describe Oystercard do

  it 'oystercard has default balance of zero' do
    expect(subject.balance).to eq 0
  end

  describe '#top_up' do
    it 'respond to top_up' do
      expect(subject).to respond_to :top_up
    end
    it 'adds top_up amount to balance' do
      amount = 5
      expect(subject.top_up(amount)).to eq subject.balance
    end
  end

end
