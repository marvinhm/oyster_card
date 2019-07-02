# frozen_string_literal: true

require './lib/OysterCard.rb'

describe OysterCard do
  minimum_balance = OysterCard::MIN_BALANCE
  maximum_balance = OysterCard::DEFAULT_LIMIT
  describe '.balance' do
    it 'Should have a balance initialized to 0' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'Should add to the balance of your oyster card' do
      subject.top_up(minimum_balance)
      expect(subject.balance).to eq minimum_balance
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
    it 'Should confirm user has started thier journey' do
      subject.top_up(minimum_balance)
      subject.touch_in
      expect(subject.in_journey).to eq(true)
    end

    it 'raise error if user is taps in while already in journey' do
      subject.top_up(minimum_balance)
      subject.touch_in
      expect { subject.touch_in }.to raise_error('You have already tapped in!')
    end

    it "raise error if balance is less than the minimum fare" do
      expect {subject.touch_in}.to raise_error("You have insufficient funds")
    end
  end

  describe '#touch_out' do
    it 'Should confrm user has ended their journey' do
      subject.top_up(minimum_balance)
      subject.touch_in
      subject.touch_out
      expect(subject.in_journey).to eq(false)
    end

    it 'raise error if user hasn not tapped in' do
      subject.top_up(minimum_balance)
      expect {subject.touch_out}.to raise_error("You have not tapped in!")
    end
  end
end
