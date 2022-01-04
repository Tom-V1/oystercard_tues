require 'oystercard'

describe Oystercard do

  
  it 'has a balance of 0' do
    expect(subject.balance).to eq(0)
  end

    # ==================================

  describe '#top_up' do
    before {subject.top_up(Oystercard::MAXIMUM_BALANCE)}
    
    it 'can top up the balance' do
      subject.deduct 1
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end
    it 'raises an error if the maximum balance is exceeded' do
      expect{ subject.top_up 1 }.to raise_error 'Maximum balance of #{maximum_balance} exceeded'
    end

  end

    # ==================================
    describe "#deduct" do 
      before {subject.top_up(Oystercard::MAXIMUM_BALANCE)}

  
      it 'deducts an amount from the balance' do
        expect{ subject.deduct 3}.to change{ subject.balance }.by -3
      end
  
  end

  # ==================================
  describe "#touch in/out" do 

    it "is initially not in a journey" do 
      expect(subject).not_to be_in_journey
    end 

    it "can touch in" do
      subject.touch_in
      expect(subject).to be_in_journey
    end

    it "can touch out" do
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end


  end 

end
