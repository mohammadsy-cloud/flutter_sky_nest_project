import 'package:freezed_annotation/freezed_annotation.dart';

import 'enumirations.dart';

class BookingStatusConverter implements JsonConverter<BookingStatus, String> {
  const BookingStatusConverter();

  @override
  BookingStatus fromJson(String json) {
    switch (json.toLowerCase()) {
      case 'activated':
        return BookingStatus.activated;
      case 'unacceptable':
        return BookingStatus.unacceptable;
      case 'canceled':
        return BookingStatus.canceled;
      default:
        throw ArgumentError('Unknown BookingStatus value: $json');
    }
  }

  @override
  String toJson(BookingStatus object) {
    final String enumString = object.name.toLowerCase();
    return enumString[0].toUpperCase() + enumString.substring(1);
  }
}
