require './lib/OysterCard.rb'

describe OysterCard do
  describe '.balance' do
    it 'Should have a balance initialized to 0' do
      expect(subject.balance).to eq 0
    end
  end

end
