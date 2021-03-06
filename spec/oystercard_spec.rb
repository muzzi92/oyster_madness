require 'oystercard'

describe Oystercard do

  let(:station) { double :station, name: :Bank, zone: 1 }
  let(:station2) { double :station, name: :London_Bridge, zone: 2}
  let(:journey) {double :journey, entry_station: :Bank, exit_station: :London_Bridge, fare: 1, add_to_journey_list: { start: :Bank, end: :London_Bridge}}

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
      amount = described_class::MAX_CAPACITY
      expect{ subject.top_up(amount) }.to raise_error "Balance full: cannot add #{amount}!"
    end
  end

  describe '#touch_in' do
    it 'will not touch in if below minimum balance' do
      expect { subject.touch_in(journey.entry_station) }.to raise_error "Balance not enough!"
    end
  end

  context 'tops up and touches in' do

    before do
      subject.top_up(10)
      subject.touch_in(journey)
    end

    describe '#touch_out' do
      it 'expects balance to be deducted on touch out' do
        expect { subject.touch_out(journey) }.to change { subject.balance }.by(-Journey::JOURNEY_COST)
      end
    end

    describe '#exit_station' do

      it 'remember the exit station on touch out' do
        subject.touch_out(journey)
        expect(subject.exit_station).to eq :London_Bridge
      end
    end

    describe '#entry_station' do

      it 'remembers the entry station on touch in' do
        expect(subject.entry_station).to eq :Bank
      end

      it 'resets entry station to nil on touch out' do
        subject.entry_station
        subject.touch_out(journey)
        expect(subject.entry_station).to be_nil
      end
    end
  end # < --- context block

  describe '#journey_list' do
    it 'checks if it returns an empty array' do
      expect(subject.journey_list).to eq []
    end
  end

  describe '#add_to_journey_list' do
    it 'expect journey list to eq hash' do
      subject.top_up(10)
      subject.touch_in(journey)
      subject.touch_out(journey)
      expect(subject.journey_list).to eq [{start: :Bank, end: :London_Bridge}]
    end
  end
  # describe '#journey_list' do
  #   it 'checks if it returns an empty array' do
  #     expect(subject.journey_list).to eq []
  #   end
  #   it 'checks if journey_list contains one journey' do
  #     subject.top_up(10)
  #     subject.touch_in(station)
  #     subject.touch_out(station2)
  #     expect(subject.journey_list.size).to eq 1
  #   end
  #   it 'checks if journey_list contains a hash' do
  #     subject.top_up(10)
  #     subject.touch_in(station)
  #     subject.touch_out(station2)
  #     expect(subject.journey_list).to eq [{:start=>:Bank, :zone_start=>1, :end=>:London_Bridge, :zone_end=>2}]
  #   end
  # end\


    # describe '#in_journey' do
    #   it 'responds as true when touch in is true' do
    #     subject.top_up(5)
    #     subject.touch_in(station)
    #     expect(subject.in_journey?).to eq true
    #   end
    # end
    # describe '#touch_out' do
      # it 'in_journey returns false when touch out' do
      #   subject.top_up(10)
      #   subject.touch_in(station)
      #   subject.touch_out(station)
      #   expect(subject.in_journey?).to eq false
      # end


end
