require 'rails_helper'
RSpec.describe Vehicle, type: :model do
  let(:vehicle) { described_class.create!(identifier: "HA-3452") }
  let(:waypoint1) { vehicle.waypoints.create!(latitude: 20.23, longitude: -0.56, sent_at: "2016-06-02 20:45:00") }
  let(:waypoint2) { vehicle.waypoints.create!(latitude: 30.54, longitude: -23.56, sent_at: "2006-02-01 23:40:20") }

  it 'is invalid without identifier' do
    vehicle.identifier = nil
    expect(vehicle).not_to be_valid
  end

  it 'is valid with identifier' do
    expect(vehicle).to be_valid
  end

  it 'has many waypoints' do
    expect(vehicle.waypoints).to include(waypoint1, waypoint2)
  end

  it 'destroy associated waypoints when destroy' do
    vehicle
    waypoint1
    waypoint2
    expect { vehicle.destroy }.to change { Waypoint.count }.from(2).to(0)
  end
end
