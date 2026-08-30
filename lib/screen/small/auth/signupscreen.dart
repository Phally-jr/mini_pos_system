import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_pos_system/screen/responsive.dart';
import 'package:mini_pos_system/controller/auth_controller.dart';

class Signupscreen extends GetView<AuthscreenController> {
   Signupscreen({super.key});
  final _formKey = GlobalKey<FormState>();
  Widget space = SizedBox(height: Responsive.h(5));
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBoy());
  }

  Widget _buildBoy() => Column(children: [
        SizedBox(height: Responsive.h(20)),
      
        Container(
          height: Responsive.h(75),
          width: double.infinity,
          decoration: BoxDecoration(

            color: Colors.blue,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
           
            children: [
              space,
              Text("create account",
                  style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),),
                space,
              Padding(
                padding: const EdgeInsets.only(left:20,right:20),
                child: Form(
                  key: _formKey,
                  child:TextFormField(
                    decoration: InputDecoration(border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)
                    )),
                    
                    ),
                        
                ),
              )


            ],
          ),

        ),

  ]);
}
