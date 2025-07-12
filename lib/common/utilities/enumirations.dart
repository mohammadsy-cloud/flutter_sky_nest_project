enum Data {
  loading,
  error,
  data,
  empty,
  done;

  bool get isDone => this == Data.done;
  bool get isError => this == Data.error;
  bool get isEmpty => this == Data.empty;
  bool get isLoading => this == Data.loading;
  bool get isData => this == Data.data;
}

extension DataX on Data {
  String toJson() => name;

  static Data fromJson(String json) =>
      Data.values.firstWhere((e) => e.name == json, orElse: () => Data.empty);
}

enum BookingStatus {
  activated,
  unacceptable,
  canceled;

  bool get isActivated => this == BookingStatus.activated;
  bool get isCanceled => this == BookingStatus.canceled;
  bool get isUnacceptable => this == BookingStatus.unacceptable;
}

enum Filter {
  location,
  all,
  rating;

  bool get isLocation => this == Filter.location;
  bool get isRating => this == Filter.rating;
  bool get isAll => this == Filter.all;
}
