import 'dart:convert';

import 'package:get/get.dart';
import 'package:mafiaeducation/controllers/flash_controller.dart';
import 'package:mafiaeducation/controllers/user_controller.dart';
import 'package:mafiaeducation/models/mentor_model.dart';
import 'package:mafiaeducation/utils/api_service.dart';
import 'package:http/http.dart' as http;

class MentorController extends GetxController {
  RxList<Mentor> mentors = <Mentor>[].obs;
  RxBool canRegist = true.obs;
  RxBool isLoading = false.obs;

  Future<void> getRecommendMentors() async {
    try {
      isLoading.value = true;
      final String authToken = await ApiService().getToken();
      var headers = ApiService().getHeaders();
      headers['Authorization'] = "Bearer $authToken";
      var url = Uri.parse('${ApiService.apiUrl}/recommended-mentors');
      http.Response response = await http.get(url, headers: headers);

      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (json['code'] == 200) {
          final List<dynamic> jsonData = json['data'];
          mentors.value =
              jsonData.map((dataJson) => Mentor.fromJson(dataJson)).toList();
          isLoading.value = false;
        } else {
          throw Exception('Failed to load mentor');
        }
      } else {
        throw Exception('Failed to get mentor');
      }
    } catch (e) {
      isLoading.value = false;
      throw Exception(e);
    }
  }

  Future<void> registMentor(
      Map<String, dynamic> body, Map<String, String> file) async {
    try {
      await UserController().updateUser({
        "full_name": body['full_name'],
        "phone": body['phone'],
        "address": body['address'],
      });
      final String authToken = await ApiService().getToken();
      var headers = ApiService().getHeaders();
      headers['Authorization'] = "Bearer $authToken";
      var url = Uri.parse('${ApiService.apiUrl}/mentor-register');

      final request = http.MultipartRequest('POST', url)
        ..headers.addAll(headers)
        ..files.addAll([
          await http.MultipartFile.fromPath(
            'photo', // Replace with the field name for the file
            file['photo'].toString(), // Path to the file you want to upload
          ),
          await http.MultipartFile.fromPath(
            'certificate', // Replace with the field name for the file
            file['certificate']
                .toString(), // Path to the file you want to upload
          ),
          await http.MultipartFile.fromPath(
            'identity_card', // Replace with the field name for the file
            file['identity_card']
                .toString(), // Path to the file you want to upload
          ),
          await http.MultipartFile.fromPath(
            'cv', // Replace with the field name for the file
            file['cv'].toString(), // Path to the file you want to upload
          ),
        ]);

      List<int?>? subjects = body['subject'];
      for (int i = 0; i < subjects!.length; i++) {
        body['subjects[$i]'] = subjects[i];
      }
      body.forEach((key, value) {
        // print('key nya $key isinya $value');
        request.fields[key] = value.toString();
      });

      final response = await http.Response.fromStream(await request.send());
      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (json['code'] == 200) {
          FlashController()
              .flashMessage(FlashMessageType.success, title: json['message']);
        } else {
          throw Exception(json['message']);
        }
      } else {
        throw Exception("Terjadi kesalahan");
      }
    } catch (e) {
      FlashController()
          .flashMessage(FlashMessageType.error, title:FlashController().setProperError(e.toString()));
      throw Exception(e);
    }
  }

  Future<void> getCanRegist() async {
    try {
      final String authToken = await ApiService().getToken();
      var headers = ApiService().getHeaders();
      headers['Authorization'] = "Bearer $authToken";
      var url = Uri.parse('${ApiService.apiUrl}/user/proposal-status');
      http.Response response = await http.get(url, headers: headers);

      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (json['code'] == 200) {
          final Map<String, dynamic> jsonData = json['data'];
          canRegist.value = jsonData['status'];
        } else {
          throw Exception('Failed to load proposal status');
        }
      } else {
        throw Exception('Failed to get proposal status');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
