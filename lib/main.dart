import 'package:chat_aplikasi/app/controllers/auth_controller.dart';
import 'package:chat_aplikasi/app/utils/error_screen.dart';
import 'package:chat_aplikasi/app/utils/splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
   await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

 FirebaseFirestore.instance;


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final authC = Get.put(AuthController(), permanent: true);

  final bool isDevMode = false ;
final Widget devPageMode = GetMaterialApp(
  debugShowCheckedModeBanner: false,
                  title: "Application",
                  initialRoute: Routes.LOGIN,
                     
                  getPages: AppPages.routes,
                );


  @override
  Widget build(BuildContext context) {


    return    isDevMode ?devPageMode: FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorScreen();
        }
        if (snapshot.connectionState == ConnectionState.done) {

          
          return FutureBuilder(
            future: Future.delayed(Duration(seconds: 3)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Obx( ()=> GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: "Application",
                  initialRoute:
                      authC.isSkipInto.isTrue
                          ? authC.isAuth.isTrue
                              ? Routes.HOME
                              : Routes.LOGIN
                          : Routes.INTRODUCTION,
                  getPages: AppPages.routes,
                ));
              }
              return FutureBuilder( builder:(context,snapshot)=> SplashScreen(),future: authC.firshInitialized(), );
            },
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
