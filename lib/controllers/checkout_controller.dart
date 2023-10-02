import 'dart:convert';
import 'package:get/get.dart';
import 'package:mafiaeducation/checkout/payment.dart';
import 'package:mafiaeducation/models/checkout_model.dart';
import 'package:mafiaeducation/utils/api_service.dart';
import 'package:http/http.dart' as http;

class CheckoutController extends GetxController {
  Rx<Checkout> checkout = Checkout().obs;
  RxBool isCheckout = true.obs;

  Future<void> setCurrent(Map<String, dynamic> jsonData) async {
    checkout.value = Checkout.fromJson(jsonData);
  }

  Future<void> store(Map<String, dynamic> body) async {
    try {
      final String authToken = await ApiService().getToken();
      var headers = ApiService().getHeaders();
      headers['Authorization'] = "Bearer $authToken";
      var url = Uri.parse('${ApiService.apiUrl}/checkout');

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (json['code'] == 200) {
          final String salesId = json['data']['sales_id'];

          Get.off(PaymentPage(
            salesId: salesId.toString(),
            showHomeButton: true,
          ));
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
