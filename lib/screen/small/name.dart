import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_pos_system/controller/home_controller.dart';

class Name extends GetView<HomeController> {
  final namecontroller = TextEditingController();

  Name({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody);
  }

  SafeArea get _buildBody {
    return SafeArea(
      child:  Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: namecontroller,
                decoration: InputDecoration(
                  hintText: "Enter your name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => controller.saveName(namecontroller.text),
              child: Text("save"),
            ),
          ],
        ),
      
    );
  }
}
