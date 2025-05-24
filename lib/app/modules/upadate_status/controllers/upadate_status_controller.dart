import 'package:chat_aplikasi/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpadateStatusController extends GetxController {
  //TODO: Implement UpadateStatusController
late TextEditingController statusC;
final authC = Get.find<AuthController>();
  final count = 0.obs;
  @override
  void onInit() {
    statusC = TextEditingController(text: authC.user.value.status?? "");
    super.onInit();
  }


  @override
  void onClose() {
    statusC.dispose();
    super.onClose();
  }

  void increment() => count.value++;
}
