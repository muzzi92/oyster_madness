require 'oystercard'

describe Oystercard do

  it 'oystercard has default balance of zero' do
    expect(subject.balance).to eq 0
  end
end
