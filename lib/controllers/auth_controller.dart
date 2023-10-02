import 'dart:convert';
import 'package:get/get.dart';
import 'package:mafiaeducation/Auth/login.dart';
import 'package:mafiaeducation/bottombar.dart';
import 'package:mafiaeducation/controllers/user_controller.dart';
import 'package:mafiaeducation/utils/api_service.dart';
import 'package:http/http.dart' as http;
import 'package:mafiaeducation/controllers/flash_controller.dart';

class AuthController extends GetxController {
  final UserController _userController = Get.find();
  final RxBool isRegist = true.obs;

  Future<void> login({required String email, required String password}) async {
    try {
      var headers = ApiService().getHeaders();
      var url = Uri.parse('${ApiService.apiUrl}/auth/login');
      Map body = {'email': email, 'password': password};

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (json['code'] == 200) {
          String? token = json['data']['token'];

          if (token != null) {
            _userController.userExists.value = false;
            await ApiService().setToken(token);
            await UserController().getUser().then((value) {
              Get.offAll(const BottomBar());
              FlashController().flashMessage(FlashMessageType.success,
                  title: "Selamat datang ${json['data']['user']['full_name']}");
            }).catchError((_) => throw Exception("Error tidak diketahui"));
          } else {
            throw Exception("Token tidak ditemukan");
          }
        } else {
          throw Exception(json['message']);
        }
      } else {
        throw Exception(json['message']);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> register(
      {required String email,
      required String password,
      required String name}) async {
    try {      
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse('${ApiService.apiUrl}/auth/register');
      Map body = {'full_name': name, 'email': email, 'password': password};

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (json['code'] == 200) {
          FlashController()
              .flashMessage(FlashMessageType.success, title: json['message']);
          Get.off(const LoginPage());
        } else {
          throw Exception(json['message']);
        }
      } else {
        throw Exception(json['message']);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> logout() async {
    try {
      final String authToken = await ApiService().getToken();
      var headers = ApiService().getHeaders();
      headers['Authorization'] = "Bearer $authToken";
      var url = Uri.parse('${ApiService.apiUrl}/auth/logout');
      http.Response response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        ApiService().destroyToken();
        Get.off(const LoginPage());
      } else {
        ApiService().destroyToken();
        Get.off(const LoginPage());
      }
    } catch (e) {
      FlashController().flashMessage(FlashMessageType.error,
          title: FlashController().setProperError(e.toString()));
      throw Exception('failed to logout');
    }
  }
}
