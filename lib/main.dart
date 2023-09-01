import 'package:flutter/material.dart';
import 'package:project_3/constant/my_constant.dart';
//import 'package:project1/screens/home_screen.dart';
import 'package:project_3/screens/bottomnavbar_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: MyConstant.success,
        primaryColor: MyConstant.info,
      ),
      home: const BottomNavBar(),
    );
  }
}
