import 'package:explanatory_dictionary/controller/set_language.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

import '../widgets/language.dart';
import 'flutter_toast.dart';

class HiveDb extends GetxController {
  SetLanguage lang  =Get.put(SetLanguage());
  var wordBox = Hive.box("word_classification");
  var listItems = [].obs;
  var listKeys = [].obs;
  var getClassification = 'Natija!'.obs;
  var isCheck = false.obs;

  storedInfo({required String wordValue, required String classificationValue}) {
    wordBox.put(wordValue, classificationValue);

    return showToast(languageMap[lang.currentLanguage.value]!["Muvaffaqiyatli saqlandi"]!);
    //Stored successfully
  }

  getInfo({required String wordKey}) {
   // refreshList();

    for (var item in wordBox.keys) {
      var getInfo = wordBox.get(item);
      listItems.add(getInfo);
      listKeys.add(item);

      if (item == wordKey) {
        getClassification.value = wordBox.get(wordKey);
        Logger().i(getClassification.toString());
        isCheck.value = true;
        break;
      }
    }
    return Logger().i(getClassification.value);

    /// kodlangan ya'ni shriflangan holda bo'ladi /// it is coded, that is, encrypted
  }

  deleteInfo({required String wordKey}) {
    wordBox.delete(wordKey);
    refreshList();
    return showToast(languageMap[lang.currentLanguage.value]!["Muvaffaqiyatli o'chirildi"]!);
  }

  void refreshList() {
    listItems.clear();
    listKeys.clear();
    for (var item in wordBox.keys) {
      listItems.add(wordBox.get(item));
      listKeys.add(item);
    }
  }
}
