require_relative './lib/oystercard.rb'
require_relative './lib/station.rb'
require_relative './lib/journey.rb'
require_relative './lib/journeylog.rb'

o = Oystercard.new
s1 = Station.new 'Aldgate', 2
s2 = Station.new 'Kings Cross', 1
s3 = Station.new 'Piccadilly', 3
s4 = Station.new 'Euston', 1
s5 = Station.new 'Turnpike Lane', 4
s6 = Station.new 'Whitechapel', 2
s7 = Station.new 'Baker Street', 5
s8 = Station.new 'Paddington', 1
s9 = Station.new 'Tottenham Court Road', 3
s10 = Station.new 'Covent Garden', 2

o.top_up 60
