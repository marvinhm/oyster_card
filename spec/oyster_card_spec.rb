require './lib/OysterCard.rb'

describe OysterCard do
  describe '.balance' do
    it 'Should have a balance initialized to 0' do
      expect(subject.balance).to eq (0)
    end
  end

  describe '#top_up' do
    it 'Should add to the balance of your oyster card' do
        subject.top_up(10)
      expect(subject.balance).to eq 10
    end
  end

  describe '#top_up' do
    it 'Raises an error if balance exceeds 90' do

      expect{subject.top_up(100)}.to raise_error 'Top-Up Limit Reached!'
    end
  end
end
