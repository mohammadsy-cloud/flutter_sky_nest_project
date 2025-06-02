class CustomResponse<T> {
  final String message;
  final int statusCode;
  final T? data;

  CustomResponse({required this.message, required this.statusCode, this.data});
}
