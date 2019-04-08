require 'oystercard'

describe Oystercard do
  it 'initialize balance to 0' do
    expect(subject.balance).to eq 0
  end

  describe '#top_up' do
    it 'top up the balance' do
      expect { subject.top_up(1) }.to change { subject.balance }.by 1
    end

    it 'raise an error message if the new balance exceed the limit' do
      message = "it exceed the amount : #{described_class::LIMIT}"
      expect { subject.top_up(described_class::LIMIT + 1) }.to raise_error(message)
    end
  end

  describe '#deduct' do
    it 'should deduct the fare to the balance' do
      expect { subject.deduct(1) }.to change { subject.balance }.by(-1)
    end
  end

  describe '#touch_in' do
    it 'should change the in_journey varible to true' do
      subject.touch_in
      expect(subject).to be_in_journey
    end
  end

  describe '#touch_out' do
    it 'should change the in_journey varible to false' do
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end
end
