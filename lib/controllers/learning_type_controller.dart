import 'package:get/get.dart';
import 'package:mafiaeducation/models/learning_type_model.dart';

class LearningTypeController extends GetxController {
  RxList<LearningType> learningTypes = <LearningType>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    // Perform the check for user data existence here
    await getLearingTypes();
  }

  Future<void> getLearingTypes() async {
    learningTypes.value = [
      LearningType(id: 1, name: "Online"),
      LearningType(id: 2, name: "Offline"),
    ];
  }
}
