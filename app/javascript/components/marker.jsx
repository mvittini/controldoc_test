import React from "react";
import { Marker } from "@react-google-maps/api";

const MarkerComponent = ({ marker, onClick }) => {
  return (
    <Marker
      position={{ lat: marker.latitude, lng: marker.longitude }}
      onClick={() => onClick(marker)}
    />
  );
};

export default MarkerComponent;
