import 'dart:convert';

import 'package:get/get.dart';
import 'package:mafiaeducation/models/learning_material_model.dart';
import 'package:mafiaeducation/utils/api_service.dart';
import 'package:http/http.dart' as http;

class LearningMaterialController extends GetxController {
  RxList<LearningMaterial> list = <LearningMaterial>[].obs;
  RxInt learningMaterialId = 0.obs;
  Rx<LearningMaterial> detail = LearningMaterial().obs;
  RxBool isLoading = false.obs;
  RxBool isLoadingDetail = false.obs;

  Future<void> getLearningMaterials(Map<String, String>? params) async {
    try {
      list.value = [];
      isLoading.value = true;
      final String authToken = await ApiService().getToken();
      var headers = ApiService().getHeaders();
      headers['Authorization'] = "Bearer $authToken";
      var url = Uri.parse('${ApiService.apiUrl}/materials');
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
              .map((dataJson) => LearningMaterial.fromJson(dataJson))
              .toList();
          isLoading.value = false;
        } else {
          throw Exception('Failed to load learning material');
        }
      } else {
        throw Exception('Failed to get learning material');
      }
    } catch (e) {
      isLoading.value = false;
      throw Exception(e);
    }
  }

  Future<void> getDetailLeariningMaterials(int? id) async {
    try {
      isLoadingDetail.value = true;
      final String authToken = await ApiService().getToken();
      var headers = ApiService().getHeaders();
      headers['Authorization'] = "Bearer $authToken";
      var url = Uri.parse('${ApiService.apiUrl}/materials/$id');
      http.Response response = await http.get(url, headers: headers);

      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (json['code'] == 200) {
          final Map<String, dynamic> jsonData = json['data'];
          detail.value = LearningMaterial.fromJson(jsonData);
          isLoadingDetail.value = false;
        } else {
          throw Exception('Failed to load learning material detail');
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

  Future<void> getMaterialUser(Map<String, String>? params) async {
    try {
      list.value = [];
      isLoading.value = true;
      final String authToken = await ApiService().getToken();
      var headers = ApiService().getHeaders();
      headers['Authorization'] = "Bearer $authToken";
      var url = Uri.parse('${ApiService.apiUrl}/user/materials');
      http.Response response = await http.get(
          url.replace(queryParameters: {
            "grade": params?['grade'],
            // "learning_method": params?['learning_method'],
            "search": params?['search'],
          }),
          headers: headers);

      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (json['code'] == 200) {
          final List<dynamic> jsonData = json['data'];
          list.value = jsonData
              .map((dataJson) => LearningMaterial.fromJson(dataJson))
              .toList();
          isLoading.value = false;
        } else {
          throw Exception(json['mesage']);
        }
      } else {
        throw Exception('Failed to get learning user material');
      }
    } catch (e) {
      isLoading.value = false;
      throw Exception(e);
    }
  }
}
