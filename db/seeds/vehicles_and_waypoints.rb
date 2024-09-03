require 'faker'


Waypoint.destroy_all
Vehicle.destroy_all


def generate_identifier
  letters = ('A'..'Z').to_a.sample(2).join
  numbers = rand(1000..9999).to_s
  "#{letters}-#{numbers}"
end

# Crea vehículos con waypoints
20.times do
  vehicle = Vehicle.create!(identifier: generate_identifier)

  # Crear entre 5 y 10 waypoints por vehículo
  rand(1..3).times do
    Waypoint.create!(
      latitude: Faker::Address.latitude.to_f,
      longitude: Faker::Address.longitude.to_f,
      sent_at: Faker::Time.between(from: 10.year.ago, to: Time.now),
      vehicle: vehicle
    )
  end
end

puts "Seed data created successfully!"
