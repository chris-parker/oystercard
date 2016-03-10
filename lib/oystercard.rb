class Oystercard
  DEFAULT_BALANCE = 0
  MAX_BALANCE = 90
  MIN_FARE = 1
  PEN_FARE = 6

  attr_reader :balance

  def initialize(journeylog = Journeylog)
    @balance = DEFAULT_BALANCE
    @journeylog = journeylog.new
  end

  def top_up(value)
    raise 'max out balance' if exceeds_max?(value)
    @balance += value
  end

  def touch_in(station)
    raise 'balance too low' if low_balance?
    @journeylog.start(station)
    deduct if @journeylog.deduct?
  end

  def touch_out(station)
    @journeylog.finish(station)
    deduct
  end

  private

  def deduct
      @balance -= @journeylog.fare
  end

  def exceeds_max?(value)
    value + balance > MAX_BALANCE
  end

  def low_balance?
    @balance <= MIN_FARE
  end
end
