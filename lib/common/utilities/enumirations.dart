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

enum BookingStatus {
  active,
  incorrect,
  canceled;

  bool get isActive => this == BookingStatus.active;
  bool get isCanceled => this == BookingStatus.canceled;
  bool get isIncorrect => this == BookingStatus.incorrect;
}
