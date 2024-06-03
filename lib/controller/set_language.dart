import 'package:get/get.dart';

class SetLanguage extends GetxController {
  var currentLanguage = 'uz'.obs;

  void setLanguage(String newLanguage) {
    currentLanguage.value = newLanguage;
  }
}

