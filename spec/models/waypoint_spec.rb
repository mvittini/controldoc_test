require 'rails_helper'
RSpec.describe Waypoint, type: :model do
  let(:vehicle) { Vehicle.new(identifier:"HA-3452")}
  let(:waypoint) { described_class.new(latitude:20.23, longitude:-0.56, sent_at:"2016-06-02 20:45:00", vehicle: vehicle)}

  it 'is invalid without latitude' do
    waypoint.latitude = nil
    expect(waypoint).not_to be_valid
  end

  it 'is invalid without longitude' do
    waypoint.longitude = nil
    expect(waypoint).not_to be_valid
  end

  it 'is invalid without sent_at' do
    waypoint.sent_at = nil
    expect(waypoint).not_to be_valid
  end

  it 'is invalid without vehicle' do
    waypoint.vehicle = nil
    expect(waypoint).not_to be_valid
  end

  it 'is valid with latitude, longitude, sent_at and vehicle' do
    expect(waypoint).to be_valid
  end

end