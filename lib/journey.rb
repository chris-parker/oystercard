class Journey

  attr_reader :entrance, :exit

  def initialize
    @entrance = nil
    @exit = nil
  end

  def start(station)
    @entrance = station
  end

  def end(station)
    @exit = station
    zones_crossed if complete?
  end

  def zones_crossed
    (@entrance.zone - @exit.zone).abs
  end

  def store_fare(value)
    @fare = value
  end

  private

  def complete?
    !!@entrance && !!@exit
  end

end
