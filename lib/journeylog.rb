require_relative 'journey'

PEN_FARE = 6

class Journeylog

  attr_accessor :deduct
  
  def journeys
    @log
  end

  def initialize
    @log = []
    @deduct = false
  end

  def start(station)
    edge_case if @journey != nil
    current_journey
    @journey.start(station)
  end

  def finish(station)
    current_journey if @journey == nil
    @journey.end(station)
    store_journey
    @deduct = true
  end


  def store_journey
    @fare = @journey.complete? ? Oystercard::MIN_FARE : PEN_FARE
    @log << @journey
    @journey = nil
  end

  def edge_case
    current_journey
    store_journey
    @deduct = true
  end

  def fare
    @fare
  end

  def deduct?
    @deduct
  end

private

  def current_journey
    return @journey || @journey = Journey.new
  end

end
