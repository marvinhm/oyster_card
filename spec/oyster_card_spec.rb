# frozen_string_literal: true

require './lib/OysterCard.rb'

describe OysterCard do
  minimum_balance = OysterCard::MIN_BALANCE
  maximum_balance = OysterCard::DEFAULT_LIMIT
  let(:enter_station) { double :enter_station }
  let(:exit_station) { double :exit_station }
  describe '.balance' do
    it 'Should have a balance initialized to 0' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'Raises an error if balance exceeds 90' do
      maximum_balance += 1
      expect { subject.top_up(maximum_balance) }.to raise_error 'Top-Up Limit Reached!'
    end
  end

  # describe '#deduct' do
  #   it 'Shoult deduct a fare price from balance' do
  #     subject.top_up(5)
  #     expect { subject.deduct(3) }.to change { subject.balance }.from(5).to(2)
  #   end
  #
  #   it 'raises error if fare price exceeds balance' do
  #     subject.top_up(5)
  #     expect { subject.deduct(8) }.to raise_error('You have insufficient funds')
  #   end
  # end

  describe '#touch_in' do
    it 'raise error if balance is less than the minimum fare' do
      expect { subject.touch_in(enter_station) }.to raise_error('You have insufficient funds')
    end

    it 'raise error if user hasn not tapped in' do
      subject.top_up(minimum_balance)
      expect { subject.touch_out(exit_station) }.to raise_error('You have not tapped in!')
    end
  end

  describe '#journey_history' do
    it 'Should record stations' do
      subject.top_up(minimum_balance)
      subject.touch_in(enter_station)
      subject.touch_out(exit_station)
      expect(subject.history).to include(entry_station: enter_station, exit_station: exit_station)
    end

    it 'Should show an empty list if no journeys have been made' do
      expect(subject.history).to eq([])
    end
  end
end
