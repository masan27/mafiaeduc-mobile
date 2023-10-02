import 'dart:convert';
import 'package:get/get.dart';
import 'package:mafiaeducation/controllers/flash_controller.dart';
import 'package:mafiaeducation/models/sales_model.dart';
import 'package:mafiaeducation/utils/api_service.dart';
import 'package:http/http.dart' as http;

class SalesController extends GetxController {
  Rx<Sales> sales = Sales().obs;
  RxBool loading = false.obs;
  RxBool isConfirm = true.obs;

  Future<void> getSales(String salesId) async {
    try {
      loading.value = true;
      final String authToken = await ApiService().getToken();
      var headers = ApiService().getHeaders();
      headers['Authorization'] = "Bearer $authToken";
      var url = Uri.parse('${ApiService.apiUrl}/invoice/$salesId');

      http.Response response = await http.get(url, headers: headers);

      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (json['code'] == 200) {
          final Map<String, dynamic> jsonData = json['data'];
          sales.value = Sales.fromJson(jsonData);
          loading.value = false;
        } else {
          throw Exception(json['message']);
        }
      } else {
        throw Exception("Terjadi kesalahan");
      }
    } catch (e) {
      loading.value = false;
      throw Exception(e);
    }
  }

  Future<void> confirmPayment(
      Map<String, dynamic> body, String filePath) async {
    try {      
      final String authToken = await ApiService().getToken();
      var headers = ApiService().getHeaders();
      headers['Authorization'] = "Bearer $authToken";
      var url = Uri.parse('${ApiService.apiUrl}/payment-confirmation');

      final request = http.MultipartRequest('POST', url)
        ..headers.addAll(headers)
        ..files.add(
          await http.MultipartFile.fromPath(
            'proof_of_payment', // Replace with the field name for the file
            filePath, // Path to the file you want to upload
          ),
        );

      body.forEach((key, value) {
        request.fields[key] = value.toString();
      });

      final response = await http.Response.fromStream(await request.send());
      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (json['code'] == 200) {
          isConfirm.value = true;
          FlashController()
              .flashMessage(FlashMessageType.success, title: json['message']);
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

  Future<void> setReview(Map<String, dynamic> body) async {
    try {
      final String authToken = await ApiService().getToken();
      var headers = ApiService().getHeaders();
      headers['Authorization'] = "Bearer $authToken";
      var url = Uri.parse('${ApiService.apiUrl}/reviews');

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (json['code'] == 200) {
          print("berhasil kasih review");
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
}
