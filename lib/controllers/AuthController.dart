import 'dart:convert';
import 'package:get/get.dart';
import 'package:mafiaeducation/Auth/login.dart';
import 'package:mafiaeducation/bottombar.dart';
import 'package:mafiaeducation/utils/ApiService.dart';
import 'package:http/http.dart' as http;
import 'package:mafiaeducation/controllers/flashcontroller.dart';

class AuthController extends GetxController {
  Future<void> login({required String email, required String password}) async {
    try {
      var headers = ApiService().getHeaders();
      var url = Uri.parse('${ApiService.baseUrl}/auth/login');
      Map body = {'email': email, 'password': password};

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (json['code'] == 200) {
          var token = json['data']['token'];
          await ApiService().setToken(token);

          Get.to(const BottomBar());
        }
      } else {
        FlashController().flashMessage('error', title: json['message']);
        return Future.error("Error");
      }
    } catch (e) {
      FlashController().flashMessage('error', title: e.toString());
      return Future.error("Error");
    }
  }

  Future<void> register(
      {required String email,
      required String password,
      required String name}) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse('${ApiService.baseUrl}/auth/register');
      Map body = {'full_name': name, 'email': email, 'password': password};

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (json['code'] == 200) {
          FlashController().flashMessage('success', title: json['message']);
          Get.to(const LoginPage());
        }
      } else {
        FlashController().flashMessage('error', title: json['message']);
        return Future.error("Error");
      }
    } catch (e) {
      FlashController().flashMessage('error', title: e.toString());
      return Future.error("Error");
    }
  }

  Future<void> logout() async {
    try {
      ApiService().destroyToken();
      Get.to(const LoginPage());
    } catch (e) {
      FlashController().flashMessage('error', title: e.toString());
      return Future.error("Error");
    }
  }
}
