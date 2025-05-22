
import 'package:chat_aplikasi/app/controllers/auth_controller.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
   LoginView({super.key});
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.transparent,
                  width: Get.width * 0.7,
                  height: Get.width * 0.7,
                  child: Lottie.asset(
                    "assets/lottie/login.json",
                    fit: BoxFit.cover,
                    repeat: true,
                    frameRate: FrameRate(60),
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Text("Error loading animation"),
                      );
                    },
                  ),
                ),
                SizedBox(height: 150),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                   


                      authC.login();
                      },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[900],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        // horizontal: 20,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 35,
                          width: 35,
                          child: Image.asset("assets/logo/google.png"),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "Sign in with Google",
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 50),
                Expanded(child: Container(),)  ,
                
                
                    
                       Text("Aplikasi Chat",style:TextStyle(fontSize: 18) ,),
                       Text("Versi 1.0",style:TextStyle(fontSize: 18) ,),
                    
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
