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
end
