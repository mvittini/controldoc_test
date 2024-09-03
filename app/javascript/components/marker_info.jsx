import React from "react";
import { InfoWindow } from "@react-google-maps/api";

const MarkerInfo = ({ marker, onClose }) => {
  return (
    <InfoWindow
      position={{ lat: marker.latitude, lng: marker.longitude }}
      onCloseClick={onClose}
    >
      <div>
        <h4>{marker.identifier}</h4>
      </div>
    </InfoWindow>
  );
};

export default MarkerInfo;
