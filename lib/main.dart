import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controllers/todo_controller.dart';
import 'package:todoapp/view/homescreen_view.dart';

void main() {
  Get.put(TODOcontroller());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'todo',
      debugShowCheckedModeBanner: false,
       theme: ThemeData(
         appBarTheme: const AppBarTheme(
           color: Colors.white,
           iconTheme: IconThemeData(color: Colors.black45)
         )
       ),
      home: HomeScreen(),
    );
  }
}
