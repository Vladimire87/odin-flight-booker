# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Airport.delete_all
# Flight.delete_all

# airport_codes = %w[SVO VKO DME JFK LAX CDG LHR HND PEK SYD]

# # Create random airports
# airport_codes.each do |code|
#   Airport.create(code:)
# end

# Create random flights
1000.times do
  departure_airport = Airport.all.sample
  arrival_airport = (Airport.all - [departure_airport]).sample
  start_datetime = DateTime.now + rand(1..30).days
  flight_duration = rand(2..8)

  Flight.create(
    departure_airport:,
    arrival_airport:,
    start_datetime:,
    flight_duration:
  )
end

puts '----seeded----'
