import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeProfileController extends GetxController {
  //TODO: Implement ChangeProfileController
  late TextEditingController emailC;
  late TextEditingController nameC;
  late TextEditingController statusC;
  

  final count = 0.obs;
  @override
  void onInit() {

    emailC = TextEditingController(text: "loremipusm@gmail.com");
    nameC = TextEditingController(text: "lorem Ipus");
    statusC = TextEditingController();
    super.onInit();
  }

  
  @override
  void onClose() {
    emailC.dispose();
    nameC.dispose();
    statusC.dispose();
    super.onClose();
  }

  
}
