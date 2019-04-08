class Oystercard
  attr_reader :balance

	LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(money)
    raise "it exceed the amount : #{LIMIT}" if (balance + money) > LIMIT

    @balance += money
  end

  def deduct(fare)
  	@balance -= fare
  end
end
