import React from "react";
import { GoogleMap, LoadScript } from "@react-google-maps/api";
import MarkerComponent from "./marker";
import MarkerInfo from "./marker_info";

const Map = ({ markers, selectedMarker, mapCenter, mapZoom, onMarkerClick, onCloseInfoWindow }) => {
  return (
    <LoadScript googleMapsApiKey={process.env.GOOGLE_MAPS_API_KEY}>
      <GoogleMap
        mapContainerClassName="map-container"
        center={mapCenter}
        zoom={mapZoom}
      >
        {markers.map((marker) => (
          <MarkerComponent
            key={marker.identifier}
            marker={marker}
            onClick={onMarkerClick}
          />
        ))}

        {selectedMarker && (
          <MarkerInfo
            marker={selectedMarker}
            onClose={onCloseInfoWindow}
          />
        )}
      </GoogleMap>
    </LoadScript>
  );
};

export default Map;
