import 'package:flutter/material.dart';
import 'package:mini_pos_system/routes/app_routes.dart';

// ignore: must_be_immutable
class Welcomescreen extends StatefulWidget {
  TextEditingController controller = TextEditingController();
  Welcomescreen({super.key});

  @override
  State<Welcomescreen> createState() => _WelcomescreenState();
}

class _WelcomescreenState extends State<Welcomescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("MINI POS SYSTEM", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 300),
            SizedBox(
              width: 280,
              child: TextField(
                controller: widget.controller,
                decoration: InputDecoration(
                  labelText: "shop's name",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Enter your shop's name",
                ),
              ),
            ),
            Text(
              "You can't change the name after this.",
              style: TextStyle(color: Color(0xFFF1F5F0)),
            ),
            SizedBox(height: 100),
            Row(
              children: [
                SizedBox(width: 320),
                Expanded(
                  child: FloatingActionButton(
                    onPressed: () {
                      RouteView.fullScreen.go(clearAll: true);
                    },
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
