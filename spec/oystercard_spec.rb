require 'oystercard'

describe Oystercard do
  it 'check oystercard responds to balance method' do
    expect(subject).to respond_to :default_balance
  end

  it 'oystercard has default balance of zero' do
    expect(subject.default_balance).to eq 0
  end
end
