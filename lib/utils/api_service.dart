import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<String> getToken() async {
    SharedPreferences localStorage = await _prefs;
    return localStorage.getString('token') ?? '';
  }

  Future<void> setToken(String value) async {
    SharedPreferences localStorage = await _prefs;
    await localStorage.setString('token', value);
  }

  void destroyToken() async {
    SharedPreferences localStorage = await _prefs;
    await localStorage.remove('token');
  }

// Local
  // static const String baseUrl = 'http://e888-182-253-245-227.ngrok-free.app';

// Prod
  static const String baseUrl = 'https://mafiaeducation.id';

  static const String apiUrl = '$baseUrl/v1';

  static const String webUrl = '$baseUrl/';

  Map<String, String> getHeaders() {
    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      // 'Authorization': 'Bearer ${token.value}',
    };
  }
}
