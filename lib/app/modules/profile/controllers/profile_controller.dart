import 'package:chat_aplikasi/app/controllers/auth_controller.dart';
import 'package:get/get.dart';


class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final count = 0.obs;
  final authC = Get.find<AuthController>();
late final Map<String,dynamic> dataArgument;

@override
  void onInit() {
    // TODO: implement onInit

    super.onInit();

  }
  void increment() => count.value++;
}
