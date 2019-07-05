require 'journey'

describe Journey do
  let(:enter_station) { double :enter_station }
  let(:exit_station) { double :exit_station }

  describe '#start' do
    it 'starts a journey' do
      subject.start(enter_station)
      expect(subject.completed?).to eq true
    end

    it 'returns a station on start' do
      expect(subject.start(enter_station)).to eq enter_station
    end

    it "returns a constant fare of 6 if entry station not returned" do
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end

    it "returns a constant fare of 6 if exit station not returned" do
      subject.start(enter_station)
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end
  end

  describe '#end' do
    it 'Should confrm user has ended their journey' do
      subject.start(enter_station)
      expect{subject.end(exit_station)}.to change{subject.completed?}.to false
    end
  end
end
