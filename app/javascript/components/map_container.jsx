import React, { useState, useEffect } from "react";
import Map from "./map";
import SearchInput from "./search_input";
import { fetchVehicles } from "./api/fetch_vehicles";
import { fetchVehicle } from "./api/fetch_vehicle";
import handleErrors from "./api/handle_errors";

const MapContainer = () => {
  const [markers, setMarkers] = useState([]);
  const [selectedMarker, setSelectedMarker] = useState(null);
  const [mapCenter, setMapCenter] = useState({ lat: 0, lng: 0 });
  const [mapZoom, setMapZoom] = useState(2);

  useEffect(() => {
    fetchVehicles()
      .then(setMarkers)
      .catch(handleErrors);
  }, []);

  const handleSearch = (searchTerm) => {
    fetchVehicle(searchTerm)
      .then(data => {
        setSelectedMarker(data);
        setMapCenter({ lat: data.latitude, lng: data.longitude });
        setMapZoom(15);
      })
      .catch(handleErrors);
  };


  return (
    <div>
      <SearchInput onSearch={handleSearch} />
      <Map
        markers={markers}
        selectedMarker={selectedMarker}
        mapCenter={mapCenter}
        mapZoom={mapZoom}
        onMarkerClick={setSelectedMarker}
        onCloseInfoWindow={() => setSelectedMarker(null)}
      />
    </div>
  );
};

export default MapContainer;
