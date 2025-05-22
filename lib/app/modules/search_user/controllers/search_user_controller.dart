import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchUserController extends GetxController {
  //TODO: Implement SearchUserController
late TextEditingController searchC;
  final count = 0.obs;
@override
void onInit() {
    super.onInit();
    searchC = TextEditingController();
  }
  @override
  void onClose() {
    searchC.dispose();
  }
  

  void increment() => count.value++;
}
