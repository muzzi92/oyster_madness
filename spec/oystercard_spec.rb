require 'oystercard'

describe Oystercard do
  it 'check oystercard responds to balance method' do
    expect(subject).to respond_to :balance
  end
end
