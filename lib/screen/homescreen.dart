import 'package:flutter/material.dart';
import 'package:mini_pos_system/widget/nameshop_widget.dart';
import 'package:mini_pos_system/widget/recentsale_widget.dart';
import 'package:mini_pos_system/widget/todaysale_widget.dart';
import '../widget/card_widget.dart';

class HomescreenWidget extends StatefulWidget {
     String  shopName="";

     HomescreenWidget({super.key,required this.shopName});
  @override
  State<HomescreenWidget> createState() => _HomescreenWidgetState();
}
class _HomescreenWidgetState extends State<HomescreenWidget> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 244, 244),
      body: Column(
        children: [
          SizedBox(height: 80),
          NameshopWidget(shopName: widget.shopName),
          SizedBox(height: 15),
          TodaysaleWidget(),
          SizedBox(height: 15),
          RecentsaleWidget(),
          Expanded(child: CardWidget()),
        ],
      ),
    );
  }
}