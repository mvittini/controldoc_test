class Api::V1::GpsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    vehicle = Vehicle.find_or_create_by(identifier: gps_params[:vehicle_identifier])
    vehicle.waypoints.create!(waypoints_params)
    render json: { vehicle: vehicle, message: "Success" }, status: :accepted
  end

  def index
    vehicles = Vehicle.all
    render json: vehicles, each_serializer: VehicleSerializer
  end

  def show
    vehicle = Vehicle.find_by!(identifier: params[:id])
    render json: vehicle, serializer: VehicleSerializer
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Vehicle not found" }, status: :not_found
  end

  private

  def gps_params
    parameters = params[:gp] || params
    parameters.permit(:latitude, :longitude, :sent_at, :vehicle_identifier)
  end

  def waypoints_params
    gps_params.except(:vehicle_identifier)
  end
end
