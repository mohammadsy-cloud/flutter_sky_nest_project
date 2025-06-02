class CustomFailure {
  CustomFailure({this.message = 'Some error occurred', this.stackTrace});
  final String message;
  final StackTrace? stackTrace;
}
