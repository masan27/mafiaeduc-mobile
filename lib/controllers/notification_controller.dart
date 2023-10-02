import 'dart:convert';
import 'package:get/get.dart';
import 'package:mafiaeducation/models/notif_model.dart';
import 'package:mafiaeducation/utils/api_service.dart';
import 'package:http/http.dart' as http;
import 'package:mafiaeducation/controllers/flash_controller.dart';

class NotificationController extends GetxController {
  RxList<Notif> notif = <Notif>[].obs;
  RxBool dots = false.obs;
  RxInt currentPage = 1.obs;
  RxBool isLoadingFirst = true.obs;
  RxBool isScrollingLoading = false.obs;
  RxBool maxPage = false.obs;

  @override
  void onInit() {
    super.onInit();

    isLoadingFirst.value = true;
  }

  Future<void> getNotifications() async {
    try {
      final String authToken = await ApiService().getToken();
      var headers = ApiService().getHeaders();
      headers['Authorization'] = "Bearer $authToken";
      var url = Uri.parse('${ApiService.apiUrl}/notifications');

      http.Response response = await http.get(
          url.replace(queryParameters: {
            "page": currentPage.value.toString(),
            "count": "10",
          }),
          headers: headers);

      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (json['code'] == 200) {
          if (json['data'].length > 0) {
            final List<dynamic> jsonData = json['data']['data'];
            notif.addAll(
                jsonData.map((dataJson) => Notif.fromJson(dataJson)).toList());
            isLoadingFirst.value = false;
            isScrollingLoading.value = false;
          } else {
            if (currentPage.value > 1) {
              currentPage.value -= 1;
            }
            isLoadingFirst.value = false;
            isScrollingLoading.value = false;
            maxPage.value = true;
          }
       } else {
          throw Exception(json['message']);
        }
      } else {
        throw Exception("Terjadi kesalahan");
      }
    } catch (e) {
      isLoadingFirst.value = false;
      isScrollingLoading.value = false;
      throw Exception(e);
    }
  }

  void resetNotification() {
    notif.value = <Notif>[];
    currentPage.value = 1;
  }

  Future<void> setRead() async {
    try {
      final String authToken = await ApiService().getToken();
      var headers = ApiService().getHeaders();
      headers['Authorization'] = "Bearer $authToken";
      var url = Uri.parse('${ApiService.apiUrl}/notifications/mark-as-read');

      http.Response response = await http.post(url, headers: headers);

      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (json['code'] == 200) {
       } else {
          throw Exception(json['message']);
        }
      } else {
        throw Exception("Terjadi kesalahan");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> getDotsNotification() async {
    try {
      final String authToken = await ApiService().getToken();
      var headers = ApiService().getHeaders();
      headers['Authorization'] = "Bearer $authToken";
      var url = Uri.parse('${ApiService.apiUrl}/notifications/new-info');
      http.Response response = await http.get(url, headers: headers);

      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (json['code'] == 200) {
          dots.value = json['data']['dots'] ?? false;
        } else {
          throw Exception('Failed to load learning class detail');
        }
      } else {
        if (authToken != '') {
          throw Exception(json['message']);
        }
      }
    } catch (e) {
      dots.value = false;
      FlashController()
          .flashMessage(FlashMessageType.error, title:FlashController().setProperError(e.toString()));
      throw Exception(e);
    }
  }
}
