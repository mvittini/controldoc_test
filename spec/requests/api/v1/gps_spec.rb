require 'rails_helper'

RSpec.describe "Api::V1::Gps", type: :request do
  before do
    host! 'localhost'
  end
  describe 'POST /api/v1/gps' do
    let(:existing_vehicle) { Vehicle.create!(identifier: "HA-3452") }
    let(:valid_params) do
      {
        latitude: 20.23,
        longitude: -0.56,
        sent_at: "2016-06-02 20:45:00",
        vehicle_identifier: "HA-3452"
      }
    end

    it 'returns a successful response' do
      get '/api/v1/gps'
      expect(response).to have_http_status(:ok)
    end

    context 'when the vehicle does not exist' do
      it 'create a new vehicle and a waypoint associated with the vehicle' do
        expect {
          post '/api/v1/gps', params: valid_params.to_json, headers: { 'Content-Type': 'application/json' }
        }.to change(Vehicle, :count).by(1)
                                    .and change(Waypoint, :count).by(1)
        expect(response).to have_http_status(:accepted)
        vehicle = Vehicle.find_by(identifier: "HA-3452")
        expect(vehicle).not_to be_nil
        expect(vehicle.waypoints.count).to eq(1)
      end
    end

    context 'when the vehicle already exists' do
      it 'does not create a new vehicle but creates a waypoint' do
        existing_vehicle
        expect {
          post '/api/v1/gps', params: valid_params.to_json, headers: { 'Content-Type': 'application/json' }
        }.to change(Vehicle, :count).by(0)
                                    .and change(Waypoint, :count).from(0).to(1)
      end
    end
  end

  describe 'GET /api/v1/gps' do
    let(:vehicle1) { Vehicle.create!(identifier: "HA-3452") }
    let(:vehicle2) { Vehicle.create!(identifier: "BW-2222") }
    let!(:waypoint1) { vehicle1.waypoints.create!(latitude: 20.23, longitude: -0.56, sent_at: "2016-06-02 20:45:00") }
    let!(:waypoint2) { vehicle1.waypoints.create!(latitude: 10.33, longitude: -0.46, sent_at: "2024-08-12 00:05:00") }
    let!(:waypoint3) { vehicle2.waypoints.create!(latitude: 15.23, longitude: -1.56, sent_at: "2018-06-02 20:45:00") }
    it "return a list of vehicle with last waypoint by sent_at" do
      get '/api/v1/gps', headers: { 'Content-Type': 'application/json' }
      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response).to be_an(Array)
      # check first vehicle
      vehicle1_response = json_response.find { |v| v['identifier'] == 'HA-3452' }
      expect(vehicle1_response).to include('identifier'=> "HA-3452", "latitude" => 10.33, "longitude" => -0.46)
      # check second vehicle
      vehicle2_response = json_response.find { |v| v['identifier'] == 'BW-2222' }
      expect(vehicle2_response).to include('identifier'=> "BW-2222", "latitude" => 15.23, "longitude" => -1.56)
    end
  end

  describe "GET /api/v1/gps/:identifier" do
    let(:vehicle1) { Vehicle.create!(identifier: "HA-3452") }
    let(:vehicle2) { Vehicle.create!(identifier: "BW-2222") }
    let!(:waypoint1) { vehicle1.waypoints.create!(latitude: 20.23, longitude: -0.56, sent_at: "2016-06-02 20:45:00") }
    let!(:waypoint2) { vehicle1.waypoints.create!(latitude: 10.33, longitude: -0.46, sent_at: "2024-08-12 00:05:00") }
    let!(:waypoint3) { vehicle2.waypoints.create!(latitude: 15.23, longitude: -1.56, sent_at: "2018-06-02 20:45:00") }

    context "when the vehicle exists" do
      it "returns the vehicle" do
        get "/api/v1/gps/#{vehicle1.identifier}"

        expect(response).to have_http_status(:ok)
      end
    end

    context "when the vehicle does not exist" do
      it "returns a 404 status" do
        get "/api/v1/gps/nonexistent_identifier"

        expect(response).to have_http_status(:not_found)
        expect(JSON.parse(response.body)["error"]).to eq("Vehicle not found")
      end
    end
  end
end
