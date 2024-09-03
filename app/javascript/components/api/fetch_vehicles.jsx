export const fetchVehicles = () => {
  return fetch("/api/v1/gps", {
    method: "GET",
    headers: {
      "Content-Type": "application/json",
    },
  }).then(response => {
    if (!response.ok) {
      throw new Error("Error fetching vehicles");
    }
    return response.json();
  });
};
