import 'package:explanatory_dictionary/pages/home_page.dart';
import 'package:explanatory_dictionary/widgets/box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/set_language.dart';

class IntroPage extends StatefulWidget {
  static const String id = "intro_page";

  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
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
                    image: AssetImage(
                      "assets/images/img.png",
                    ))),
          ),
          ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Column(
                children: [
                  GestureDetector(
                    child: MakeBox(text: 'O\'zbek'),
                    onTap: () {
                      lang.setLanguage('uz'); // Update language state to Uzbek

                      Navigator.pushNamed(context, HomePage.id);
                    },
                  ),
                  GestureDetector(
                    child: const MakeBox(text: "Pусский язык"),
                    onTap: () {
                      lang.setLanguage('ru'); // Update language state to Uzbek

                      Navigator.pushNamed(context, HomePage.id);
                    },
                  ),
                  GestureDetector(
                    child: const MakeBox(text: "English"),
                    onTap: () {
                      lang.setLanguage('en'); // Update language state to Uzbek

                      Navigator.pushNamed(context, HomePage.id);
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
