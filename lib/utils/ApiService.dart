import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  var token = ''.obs;

  Future<String> getToken() async {
    SharedPreferences localStorage = await _prefs;
    token.value = localStorage.getString('token') ?? '';
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

  static const String baseUrl =
      'http://api-test.mutualproperty.co.id/v1'; // Ganti dengan URL API yang sesuai

  Map<String, String> getHeaders() {
    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }
}
