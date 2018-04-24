require 'station'

describe Station do

  describe '#initialize' do
    it 'must make its name on initialization' do
      station = Station.new :Bank, 1
      expect(station.name).to eq :Bank
    end
    it 'must make its zone on initialization' do
      station = Station.new :Bank, 1
      expect(station.zone).to eq 1
    end
  end

end
