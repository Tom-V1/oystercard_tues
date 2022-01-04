require 'oystercard'

describe Oystercard do
  let(:station){ double :station }
  
  it 'has a balance of 0' do
    expect(subject.balance).to eq(0)
  end

    # ==================================

  describe '#top_up' do
    
    it 'can top up the balance' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end
    it 'raises an error if the maximum balance is exceeded' do
      subject.top_up(Oystercard::MAXIMUM_BALANCE)
      expect{ subject.top_up 1 }.to raise_error 'Maximum balance of #{maximum_balance} exceeded'
    end

  end

    # ==================================
    describe "#deduct" do 
      before {subject.top_up(Oystercard::MAXIMUM_BALANCE)}

      it "deducts fair on touch_out" do 
        subject.touch_in(station)
        expect{ subject.touch_out }.to change{ subject.balance }.by(-Oystercard::MINIMUM_CHARGE)
      end 
  
  end

  # ==================================
  describe "#touch in/out" do 

    before {subject.top_up(Oystercard::MAXIMUM_BALANCE)}

    it "is initially not in a journey" do 
      expect(subject).not_to be_in_journey
    end 

    it "can touch in" do
      subject.touch_in(station)
      expect(subject).to be_in_journey
    end

    it "can touch out" do
      subject.touch_in(station)
      subject.touch_out
      expect(subject).not_to be_in_journey
    end

  end 

  describe "#error checking" do 

    it 'will not touch in if below minimum balance' do
      expect{ subject.touch_in(station) }.to raise_error "Insufficient balance to touch in"
    end

  end 

  describe "#station" do
  before {subject.top_up(Oystercard::MAXIMUM_BALANCE)}

it 'stores the entry station' do
  subject.touch_in(station)
  expect(subject.entry_station).to eq station
end
end
end
