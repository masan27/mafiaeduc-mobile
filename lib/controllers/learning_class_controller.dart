import 'dart:convert';

import 'package:get/get.dart';
import 'package:mafiaeducation/models/learning_class_model.dart';
import 'package:mafiaeducation/utils/api_service.dart';
import 'package:http/http.dart' as http;

class LearningClassController extends GetxController {
  RxList<LearningClass> list = <LearningClass>[].obs;
  Rx<LearningClass> detail = LearningClass().obs;
  RxBool isLoading = false.obs;
  RxBool isLoadingDetail = false.obs;

  Future<void> getLearningClasses(Map<String, String>? params) async {
    try {
      isLoading.value = true;
      final String authToken = await ApiService().getToken();
      var headers = ApiService().getHeaders();
      headers['Authorization'] = "Bearer $authToken";
      var url = Uri.parse('${ApiService.apiUrl}/group-classes');
      http.Response response = await http.get(
          url.replace(queryParameters: {
            "grade": params?['grade'],
            "learning_method": params?['learning_method'],
            "search": params?['search'],
          }),
          headers: headers);

      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (json['code'] == 200) {
          final List<dynamic> jsonData = json['data'];
          list.value = jsonData
              .map((dataJson) => LearningClass.fromJson(dataJson))
              .toList();
          isLoading.value = false;
        } else {
          throw Exception('Failed to load learning class');
        }
      } else {
        throw Exception('Failed to get learning class');
      }
    } catch (e) {
      isLoading.value = false;
      throw Exception(e);
    }
  }

  Future<void> getDetailLeariningClass(int id) async {
    try {
      isLoadingDetail.value = true;
      final String authToken = await ApiService().getToken();
      var headers = ApiService().getHeaders();
      headers['Authorization'] = "Bearer $authToken";
      var url = Uri.parse('${ApiService.apiUrl}/group-classes/${id}');
      http.Response response = await http.get(url, headers: headers);

      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (json['code'] == 200) {
          final Map<String, dynamic> jsonData = json['data'];
          detail.value = LearningClass.fromJson(jsonData);
          isLoadingDetail.value = false;
        } else {
          throw Exception('Failed to load learning class detail');
        }
      } else {
        if (authToken != '') {
          throw Exception(json['message']);
        }
      }
    } catch (e) {
      isLoadingDetail.value = false;
      throw Exception(e);
    }
  }
}
