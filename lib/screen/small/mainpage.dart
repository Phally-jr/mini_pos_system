import 'package:flutter/material.dart';
import 'package:mini_pos_system/screen/small/productscreen.dart';
import 'package:mini_pos_system/screen/small/salesscreen.dart';
import 'package:mini_pos_system/screen/widget/bottomnavbar_widget.dart';
import 'package:mini_pos_system/screen/small/homescreen.dart';
class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> {
  int index = 0;
  void onTap() {}
  @override
  Widget build(BuildContext context) {
    List pages = [
      HomescreenWidget(),
      Productscreen(),
      Salesscreen(),
      
    ];
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 252, 252),
      body: pages[index],
      bottomNavigationBar: BottomnavbarWidget(
        currentI: index,
        onTap: (i) => setState(() {
          index = i;
        }),
      ),
    );
  }
}
