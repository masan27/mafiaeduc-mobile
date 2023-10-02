import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum FlashMessageType {
  error,
  success,
  warning,
  info,
}

class FlashController extends GetxController {
  void flashMessage(FlashMessageType type, {String? title, String? message}) {
    Color bg = Colors.grey;
    switch (type) {
      case FlashMessageType.success:
        bg = Colors.green;
        break;
      case FlashMessageType.error:
        bg = Colors.red;
        break;
      case FlashMessageType.warning:
        bg = Colors.orange;
        break;
      case FlashMessageType.info:
        bg = Colors.indigo;
        break;
    }
    // bool checkMessage = showMessage ?? true;
    String messageBody;
    if (title != null) {
      messageBody = message ?? "";
    } else {
      messageBody = "";
    }
    Get.snackbar(
      title ?? message ?? "Terjadi kesalahan",
      messageBody,
      colorText: Colors.white,
      backgroundColor: bg,
      snackPosition: SnackPosition.BOTTOM,
      borderColor: Colors.grey,
      borderRadius: 10,
      borderWidth: 2,
      barBlur: 0,
    );
  }

  String setProperError(String text){
    return text.replaceAll('Exception: ', '');
  }
}
