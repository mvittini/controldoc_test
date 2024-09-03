# lib/tasks/vehicles_and_waypoints.rake
namespace :db do
  desc "Seed the database with vehicles and waypoints"
  task seed_vehicles_and_waypoints: :environment do
    load Rails.root.join('db/seeds/vehicles_and_waypoints.rb')
  end
end
