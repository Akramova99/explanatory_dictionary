import 'package:explanatory_dictionary/controller/set_language.dart';
import 'package:explanatory_dictionary/pages/add_word_page.dart';
import 'package:explanatory_dictionary/pages/delete_page.dart';
import 'package:explanatory_dictionary/pages/intro_page.dart';
import 'package:explanatory_dictionary/pages/search_page.dart';
import 'package:explanatory_dictionary/widgets/box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/language.dart';

class HomePage extends StatelessWidget {
  static const String id = "HomePage";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SetLanguage lang = Get.put(SetLanguage());
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
                  GestureDetector(
                    child:
                        //Obx(()=>  MakeBox(text:languageMap[lang.currentLanguage]![ "So'z qidirish"]!)),
                        MakeBox(
                            text:

                            languageMap[lang.currentLanguage.value]![
                                "So'z qidirish"]!),
                    onTap: () {
                      Navigator.pushNamed(context, SearchPage.id);
                    },
                  ),
                  GestureDetector(
                    child:
                        // Obx(()=>  MakeBox(text: languageMap[lang.currentLanguage]!["So'z qo'shish"]!)),
                        MakeBox(
                            text: languageMap[lang.currentLanguage.value]![
                                "So'z qo'shish"]!),
                    onTap: () {
                      Navigator.pushNamed(context, AddPage.id);
                    },
                  ),
                  GestureDetector(
                    child:
                        //Obx(()=>  MakeBox(text:languageMap[lang.currentLanguage] !["So'z o'chirish"]!)),
                        MakeBox(
                            text: languageMap[lang.currentLanguage.value]![
                                "So'z o'chirish"]!),
                    onTap: () {
                      Navigator.pushNamed(context, DeletePage.id);
                    },
                  ),
                  GestureDetector(
                    child:
                        // Obx(()=> MakeBox(text:languageMap[lang.currentLanguage]! ["Til tanlash"]!)),
                        MakeBox(
                            text: languageMap[lang.currentLanguage.value]![
                                "Til tanlash"]!),
                    onTap: () {
                      Navigator.pushNamed(context, IntroPage.id);
                    },
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
