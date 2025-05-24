import 'package:chat_aplikasi/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeProfileController extends GetxController {
  //TODO: Implement ChangeProfileController
  late TextEditingController emailC;
  late TextEditingController nameC;
  late TextEditingController statusC;
  
final authC = Get.find<AuthController>();

  final count = 0.obs;
  @override
  void onInit() {

    emailC = TextEditingController(text: authC.user.value.email);
    nameC = TextEditingController(text: authC.user.value.name);
    statusC = TextEditingController(text: authC.user.value.status?? "");
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
