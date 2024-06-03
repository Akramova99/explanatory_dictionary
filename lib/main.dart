import 'package:explanatory_dictionary/pages/add_word_page.dart';
import 'package:explanatory_dictionary/pages/delete_page.dart';
import 'package:explanatory_dictionary/pages/home_page.dart';
import 'package:explanatory_dictionary/pages/intro_page.dart';
import 'package:explanatory_dictionary/pages/admin_page.dart';
import 'package:explanatory_dictionary/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox("word_classification");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const IntroPage(),
      routes: {
        HomePage.id:(context)=>const HomePage(),
        SearchPage.id:(context)=>const SearchPage(),
        AddPage.id:(context)=>const AddPage(),
        DeletePage.id:(context)=>const DeletePage(),
        IntroPage.id:(context)=>const IntroPage(),
      },
    );
  }
}


