class AuthenticationEndpoints {
  static const String prefix = 'auth';
  static const String signUp = '/$prefix/register';
  static const String login = '/$prefix/login';
  static const String logout = '/$prefix/logout';
  static const String verifyOTP = '/$prefix/verify-otp';
  static const String changePasswordEmail = '/$prefix/remember-password';
  static const String changePasswordCode = '/$prefix/remember-verify';
  static const String changePassword = '/$prefix/pass-update';
  static const String profile = '/user/profile';
}
