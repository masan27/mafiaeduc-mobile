import 'package:get/get.dart';
import 'package:mafiaeducation/models/gender_model.dart';

class GenderController extends GetxController {
  RxList<Gender> genders = <Gender>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    // Perform the check for user data existence here
    await getGenders();
  }

  Future<void> getGenders() async {
    genders.value = [
      Gender(name: "pria", description: "Laki-laki"),
      Gender(name: "wanita", description: "Perempuan"),
    ];
  }
}
