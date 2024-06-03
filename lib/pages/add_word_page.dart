import 'package:explanatory_dictionary/controller/set_language.dart';
import 'package:explanatory_dictionary/service/hive_db.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../widgets/box.dart';
import '../widgets/language.dart';

class AddPage extends StatefulWidget {
  static const String id = "AddPage";

  const AddPage({super.key});

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController wordController = TextEditingController();
  TextEditingController classificationController = TextEditingController();
  HiveDb db = Get.put(HiveDb());
  SetLanguage lang = Get.put(SetLanguage());

  @override
  void dispose() {
    wordController.dispose();
    classificationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/img.png"),
              ),
            ),
          ),
          ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              //MediaQuery.of(context).size.width < 600
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),
                    constraints: GetPlatform.isAndroid
                        ? const BoxConstraints(maxWidth: 280.0)
                        : const BoxConstraints(maxWidth: 400.0),
                    // Set a maximum width
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      children: [
                        Obx(()=>Text(
                          languageMap[lang.currentLanguage.value]!["Atama"]!,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          constraints: const BoxConstraints(maxWidth: 400.0),
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child:
                            Obx(()=>TextField(
                              controller: wordController,
                              decoration:  InputDecoration(
                                border: InputBorder.none,
                                hintText:languageMap[lang.currentLanguage.value]! ['Kiriting']!,
                              ),
                            )),
                          ),
                        ),
                         Obx(()=>Text(
                           languageMap[lang.currentLanguage.value]! ['Tasnifi']!,
                           style: TextStyle(fontSize: 18),
                         )),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          constraints: const BoxConstraints(maxWidth: 400.0),
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child:
                            Obx(()=>TextField(
                              controller: classificationController,
                              decoration:  InputDecoration(
                                border: InputBorder.none,
                                hintText:languageMap[lang.currentLanguage.value]! ['Kiriting']!,
                              ),
                            )),
                          ),
                        ),
                        GestureDetector(
                          child: Obx(()=> MakeBox(text:languageMap[lang.currentLanguage.value]! ["Qo'shish"]! )),
                          onTap: () {
                            Logger().i(MediaQuery.of(context).size.width);
                            Logger().i(280 / MediaQuery.of(context).size.width);
                            db.storedInfo(
                              wordValue: wordController.text.trim(),
                              classificationValue:
                                  classificationController.text.trim(),
                            );
                            // await HiveDb.storedInfo(
                            //   wordValue: wordController.text.trim(),
                            //   classificationValue:
                            //   classificationController.text.trim(),
                            // );
                            wordController.clear();
                            classificationController.clear();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
