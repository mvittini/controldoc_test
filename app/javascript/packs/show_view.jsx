import React from "react";
import ReactDOM from "react-dom";
import ShowView from "../components/show_view";

document.addEventListener("DOMContentLoaded", () => {
  const rootElement = document.getElementById("root");
  if (rootElement) {
    ReactDOM.render(<ShowView />, rootElement);
  }
});