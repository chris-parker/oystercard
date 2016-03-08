require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }
  let(:station) { double :station }
  let(:station1) { double :station }
  let(:journey) {double :journey}

  describe '#balance' do
    it 'initializes with an empty balance' do
      expect(subject.balance).to eq(0)
    end
  end

  describe '#top_up' do
    it 'increases balance by argument when you top up' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end

    it 'has a maximum balance of £90' do
      error = Oystercard::MAX_BALANCE_ERROR
      expect{subject.top_up(Oystercard::MAX_BALANCE + 1)}.to raise_error error
    end

  end

  describe '#touch_in' do

    it 'requires a minimum balance to travel' do
      expect{ subject.touch_in station}.to raise_error Oystercard::MIN_BALANCE_ERROR
    end

  end

  describe '#touch_out' do

    before(:each) do
      subject.top_up 10
	  	subject.touch_in station
    end

	  it 'reduces the balance' do
	  	expect{subject.touch_out station1}.to change{subject.balance}.by -Journey::MIN_FARE
	  end

  end

  
end
