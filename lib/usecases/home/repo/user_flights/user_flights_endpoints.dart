class UserFlightsEndpoints {
  static const prefix = '/user/flight';
  static const viewFlights = '$prefix/viewFlights';
  static const viewFlightDetails = '$prefix/viewFlightDetails';
  static const viewActiveFlight = '$prefix/viewActiveFlight';
  static const viewCanceledFlight = '$prefix/viewCanceledFlight';
  static const viewIncorrectFlight = '$prefix/viewIncorrectFlight';
  static const searchByStartingAndEndingPointInAll =
      '$prefix/searchByStartingAndEndingPointInAll';
  static const searchByStartingAndEndingPoint =
      '$prefix/searchByStartingAndEndingPoint';
  static const searchAvailableFlightsForDateAndLocation =
      '$prefix/searchAvailableFlightsForDateAndLocation';
}
