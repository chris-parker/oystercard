require_relative 'journey'

class Journeylog

  attr_reader :journeys

  def initialize(journey_klass: )
    @journey_class = journey_klass
    @journeys = []
  end

  def start station
    finish(:penalty) if !!@journey
    current_journey
    @journey.start station
  end

  def finish station
    current_journey
    @journey.finish station
    log @journey
    @journey = nil
  end


  private
  attr_reader :journey_class, :current_journey, :journey

  def current_journey
    @journey = journey.nil? ? journey_class.new : journey
  end

  def log journey1
    @journeys << journey1
  end

  def penalty

  end

end
