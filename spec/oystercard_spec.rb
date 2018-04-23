require 'oystercard'

describe Oystercard do

  it 'oystercard has default balance of zero' do
    expect(subject.balance).to eq 0
  end

  describe '#top_up' do
    it 'respond to top_up' do
      expect(subject).to respond_to :top_up
    end
  end

end
