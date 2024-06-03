import 'package:explanatory_dictionary/controller/set_language.dart';
import 'package:explanatory_dictionary/pages/admin_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../service/hive_db.dart';
import '../widgets/language.dart';

class DeletePage extends StatefulWidget {
  static const String id = "DeletePage";

  const DeletePage({super.key});

  @override
  State<DeletePage> createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  HiveDb db = Get.put(HiveDb());
  SetLanguage lang = Get.put(SetLanguage());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db.refreshList();
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
                  Obx(
                    () {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: db.listItems.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: delete(index),
                            );
                          });
                    },
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget delete(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          constraints:const BoxConstraints(maxWidth: 260.0),

          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => Text(
                      "${languageMap[lang.currentLanguage.value]!["Atama"]!} : ${db.listKeys[index]}")),
                  Obx(() => Text(
                      "${languageMap[lang.currentLanguage.value]!["Tasnifi"]!}: ${db.listKeys[index]}")),
                ],
              ),
              IconButton(
                  onPressed: () {
                    Get.to(AdminPage(index: index));
                  },
                  icon: const Icon(Icons.delete))
            ],
          ),
        ),
      ],
    );
  }
}
