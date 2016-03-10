require_relative 'station'
require_relative 'journey'

class Oystercard

attr_reader :balance, :journey, :in_journey, :current_journey, :journey_history

MIN_FARE = 1
MAX_BALANCE = 90
DEFAULT_BALANCE = 0

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @in_journey = false
    @journey_history = []
  end

  def top_up(amount)
    raise "exceeded max top up" if @balance + amount > MAX_BALANCE
      @balance += amount
  end

  def touch_in(station, journey_class = Journey.new)
    raise "not enough funds" if balance < MIN_FARE
    touch_out("Penalty") if !!journey
    @journey = journey_class
    journey.start_journey(station)
  end

  def touch_out(station)

          #journey.end_journey(station)
      #@in_journey = false
      #deduct(journey.fare)
      # @journey_history << journey.dup
      # journey.clear_journey
  end

  def in_journey?
    @in_journey
  end

  private

  def deduct(amount)
    @balance -= amount
  end





end
