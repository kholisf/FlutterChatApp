import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpadateStatusController extends GetxController {
  //TODO: Implement UpadateStatusController
late TextEditingController statusC;

  final count = 0.obs;
  @override
  void onInit() {
    statusC = TextEditingController();
    super.onInit();
  }


  @override
  void onClose() {
    statusC.dispose();
    super.onClose();
  }

  void increment() => count.value++;
}
