import 'package:get/get.dart';
import 'dart:convert';
import 'package:mafiaeducation/models/user_model.dart';
import 'package:mafiaeducation/utils/api_service.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  Rx<User> user = User().obs;
  RxBool userExists = false.obs;

  Future<void> getUser() async {
    try {
      userExists.value = false;
      final String authToken = await ApiService().getToken();
      var headers = ApiService().getHeaders();
      headers['Authorization'] = "Bearer $authToken";
      var url = Uri.parse('${ApiService.apiUrl}/auth/user');
      http.Response response = await http.get(url, headers: headers);

      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (json['code'] == 200) {
          final Map<String, dynamic> jsonData = json['data'];
          user.value = User.fromJson(jsonData);
          userExists.value = true;
        } else {
          ApiService().destroyToken();
          userExists.value = false;
          throw Exception('Failed to load users');
        }
      } else {
        ApiService().destroyToken();
        userExists.value = false;
        if (authToken != '') {
          throw Exception('Failed to get users');
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updateUser(Map<String, dynamic> body) async {
    try {
      final String authToken = await ApiService().getToken();
      var headers = ApiService().getHeaders();
      headers['Authorization'] = "Bearer $authToken";
      var url = Uri.parse('${ApiService.apiUrl}/user/update');

      http.Response response =
          await http.put(url, body: jsonEncode(body), headers: headers);

      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (json['code'] == 200) {
          print('update user berhasil');
        } else {
          throw Exception(json['message']);
        }
      } else {
        throw Exception(json['message']);
        // throw Exception("Terjadi Kesalahan");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
