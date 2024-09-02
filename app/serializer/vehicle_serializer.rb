class VehicleSerializer < ActiveModel::Serializer
  attributes :identifier, :latitude, :longitude

  def latitude
    last_waypoint.latitude
  end

  def longitude
    last_waypoint.longitude
  end

  private

  def last_waypoint
    object.waypoints.order(sent_at: :desc).limit(1).first
  end
end
