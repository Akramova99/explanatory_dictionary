import 'package:explanatory_dictionary/controller/set_language.dart';
import 'package:explanatory_dictionary/widgets/box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../service/hive_db.dart';
import '../widgets/language.dart';

class SearchPage extends StatefulWidget {
  static const String id = "SearchPage";

  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  HiveDb db = Get.put(HiveDb());
  SetLanguage lang = Get.put(SetLanguage());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      db.getClassification.value =
          languageMap[lang.currentLanguage.value]!["Natija!"]!;
    });
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
                    image: AssetImage(
                      "assets/images/img.png",
                    ))),
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
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    constraints: const BoxConstraints(maxWidth: 400.0),
                    // Set a maximum width

                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                db.getInfo(
                                    wordKey: searchController.text.trim());
                              },
                              icon: const Icon(Icons.search)),
                          border: InputBorder.none,
                          hintText: languageMap[lang.currentLanguage.value]![
                              'Qidiruv'],
                        ),
                      ),
                    ),
                  ),
                  ///////////////////////////////////////////////////////searchController.text!=""?
                  // Obx(() => MakeBox(
                  //     text: db.isCheck.value
                  //         ? db.getClassification.value
                  //         : "Bunday natija yo'q")),
                  Obx(() => MakeBox(text: db.getClassification.value))
                  //getClassification() ?? "Natija!"
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
