import 'package:explanatory_dictionary/controller/set_language.dart';
import 'package:explanatory_dictionary/service/hive_db.dart';
import 'package:explanatory_dictionary/widgets/box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/language.dart';

class AdminPage extends StatefulWidget {
  final int index;

  const AdminPage({super.key, required this.index});

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  TextEditingController searchController = TextEditingController();

  HiveDb db = Get.put(HiveDb());
  SetLanguage lang = Get.put(SetLanguage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/img_1.png"),
              ),
            ),
          ),
          ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              //MediaQuery.of(context).size.width < 600
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    constraints: GetPlatform.isAndroid
                        ? const BoxConstraints(maxWidth: 250.0)
                        : const BoxConstraints(maxWidth: 400.0),
                    // Set a maximum width
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    //,horizontal: 10
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Center(
                        child: Obx(() => Text(
                              languageMap[lang.currentLanguage.value]![
                                  "Ushbu bo'limdan faqat adminstratorlar foydalana oladi!"]!,
                              style: TextStyle(color: Colors.white),
                            ))),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    constraints: const BoxConstraints(maxWidth: 400.0),
                    // Set a maximum width

                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Obx(
                          () => TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  if (searchController.text == "AdminPass 1") {
                                    db.deleteInfo(
                                        wordKey: db.listKeys[widget.index]);

                                    Navigator.pop(context);
                                  }
                                },
                                icon: const CircleAvatar(
                                  backgroundColor: Color(0xff4147D5),
                                  child: Text(
                                    "OK",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              hintText:
                                  " ${languageMap[lang.currentLanguage.value]!['Parolni kiriting']}...",
                            ),
                            obscureText: true,
                          ),
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60.0),
                      child: Obx(() => MakeBox(
                          text: languageMap[lang.currentLanguage.value]![
                              "Ortga"]!)),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
