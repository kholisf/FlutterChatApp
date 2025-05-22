import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;

late final Map<String,dynamic> dataArgument;
@override
  void onInit() {
    // TODO: implement onInit
GetStorage box = GetStorage();
print("on inin jalan ");
print(box.read("dataUser"));
    dataArgument = box.read("dataUser");
    super.onInit();
  }
  void increment() => count.value++;
}
