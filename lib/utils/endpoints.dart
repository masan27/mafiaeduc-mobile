class ApiEndPoints {
  static final String baseUrl = 'http://api-test.mutualproperty.co.id/v1';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = '/auth/register';
  final String loginEmail = '/auth/login';
}
