import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_pos_system/config/routes/app_routes.dart';
import 'package:mini_pos_system/controller/auth_controller.dart';
import 'package:mini_pos_system/screen/responsive.dart';

class LoginScreen extends GetView<AuthscreenController> {
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  Widget space = SizedBox(height: Responsive.h(5));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 244, 244),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        SizedBox(height: Responsive.h(20)),
        Container(
          height: Responsive.h(75),
          width: Responsive.w(100),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            children: [
              space,
              Text(
                "Welcome back!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
              ),
              space,
              SizedBox(
                width: double.infinity,
                child: Text(
                  "       please login to your account",
                  style: TextStyle(fontSize: 16, color: Colors.white60),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          final emailRegex = RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          );
                          if (!emailRegex.hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      space,
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      ),
                      space,
                      SizedBox(
                        width: Responsive.w(40),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Process the login
                            }
                          },
                          child: Text("Login"),
                        ),
                      ),
                      space,
                      space,
                      Row(
                        children: [
                          SizedBox(width: Responsive.w(20)),
                          Text("Don't have account?"),
                          TextButton(
                            onPressed: () {
                              RouteView.signupscreen.go() ;
                            },
                            child: Text("Register"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
