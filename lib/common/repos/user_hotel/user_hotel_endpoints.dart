class UserHotelEndpoints {
  static const prefix = 'user/hotel';
  static const showAllHotels = '$prefix/all_hotel';
  static const hotelEvaluation = '$prefix/hotelEvaluation';
  static const showHotelById = '$prefix/show-hotel';
  static const filterByRating = '$prefix/filterByRating';
  static const showHotelByLocation = '$prefix/showHotelByLocation';
  static const showHotelImage = '$prefix/hotelImage';
  static const showHotelDirect = '$prefix/showHotelDirect';

  //? Reservation
  static const showActiveReservation = '$prefix/activeReservation';
  static const showCanceledReservation = '$prefix/canceledReservation';
  static const showIncorrectReservation = '$prefix/incorrectReservation';

  //? Rooms
  static const booking = '$prefix/booking';
  static const bookingDirect = '$prefix/bookingDirect';
  static const bookingCansel = '$prefix/bookingCansel';
}
