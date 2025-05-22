import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRoomController extends GetxController {
  
  TextEditingController messageC = TextEditingController();
late RxBool emojiShow;
  final count = 0.obs;
  late FocusNode focusNode ;
  
@override
  void onInit() {
    super.onInit();
    focusNode = FocusNode();
    emojiShow = false.obs;
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        // Do something when the TextField is focused
emojiShow.value= false;

      } else {
        // Do something when the TextField is unfocused
      }
    });
    messageC = TextEditingController();
  }

  @override
  void onClose() {
    focusNode.dispose();
    messageC.dispose();
  } 
  

  void increment() => count.value++;
}
