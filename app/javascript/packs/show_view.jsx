import React from "react";
import ReactDOM from "react-dom";
import MapContainer from "../components/map_container";

document.addEventListener("DOMContentLoaded", () => {
  const rootElement = document.getElementById("root");
  if (rootElement) {
    ReactDOM.render(<MapContainer />, rootElement);
  }
});
