export const fetchVehicle = (identifier) => {
  return fetch(`/api/v1/gps/${identifier}`, {
    method: "GET",
    headers: {
      "Content-Type": "application/json",
    },
  }).then(response => {
    if (!response.ok) {
      throw new Error("Vehicle not found");
    }
    return response.json();
  });
};
