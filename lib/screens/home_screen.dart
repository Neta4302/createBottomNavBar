import 'package:flutter/material.dart';
import 'package:project1/constant/my_constant.dart';
import 'bottomnavbar_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'My First App Using Flutter!',
          style: MyConstant().h1Style(),
        ),
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
          size: 24,
        ),
        actions: const [
          Icon(Icons.search, color: Colors.white, size: 24,),
          SizedBox(width: 10,),
          Icon(Icons.add, color: Colors.white, size: 24,),
          SizedBox(width: 10,),
          Icon(Icons.person, color: Colors.white, size: 24,),
          SizedBox(width: 10,),
        ],
      ),
      body: const Center(
        child: Text(
          'HOME SCREEN',
          style: TextStyle(
            color: Colors.black,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    bottomNavigationBar: const BottomNavBar(),
    );
  }
}
