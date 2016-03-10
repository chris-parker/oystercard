class Journeylog

  attr_reader :current_journey, :fare

  def initialize
    @journeys = []
    @deduct = false
  end

  def start(station)
    @deduct = false
    charge_penalty && store_journey_info if previous_journey_incomplete?
    current_journey.start(station)
  end

  def finish(station)
    current_journey.end(station)
    current_journey.entrance.nil? ? charge_penalty : charge_fare
    store_journey_info
    @deduct = true
  end

  def deduct?
    @deduct
  end

  def journeys
    @journeys.dup
  end

  def previous_journey_incomplete?
    @current_journey != nil
  end

private

  def current_journey
    return @current_journey || @current_journey = Journey.new
  end

  def charge_penalty
    @fare = Oystercard::PEN_FARE
    @deduct = true
  end

  def charge_fare
    @fare = @current_journey.zones_crossed + 1
  end

  def store_journey_info
    @journeys << @current_journey
    @current_journey.store_fare(fare)
    @current_journey = nil
  end

end
