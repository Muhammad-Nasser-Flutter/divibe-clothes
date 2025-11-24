enum SignUpMethod { email, phone }

enum TripType { oneWay, roundTrip }

enum FlightTripType { oneWay, roundTrip, multiCity }

enum TripVehicleType { train, plane, bus }

enum UserType { guest, user }

enum SeatType { empty, toilet, seat }

enum SeatStatus { available, notAvailable, reserved }

enum NavigationsTrackerScreens {
  // outside screens
  unknown,
  outside,
  paused,
  home,
  // Trip Finding
  enterBusData,
  enterFlightData,
  enterTrainData,
  enterAccommodationData,
  // Trips Search
  busTripsSearch,
  busTripsFilters,

  flightTripsSearch,
  flightTripsFilters,
  trainTripsSearch,
  accommodationSearch,

  // Booking Process Pages
  busBookingProcessPage1,
  busBookingProcessPage2,
  busBookingProcessPage3,

  chooseBusSeats,
  paymentView,
  successfulBusBooking,
}
