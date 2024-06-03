import 'package:get/get.dart';

class SetLanguage extends GetxController {
  var currentLanguage = 'en'.obs;

  void setLanguage(String newLanguage) {
    currentLanguage.value = newLanguage;
  }
}
