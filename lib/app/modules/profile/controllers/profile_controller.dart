import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final count = 0.obs;
late final Map<String,dynamic> dataArgument;

@override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
GetStorage box = GetStorage();
    dataArgument = box.read("dataUser");
  }
  void increment() => count.value++;
}
