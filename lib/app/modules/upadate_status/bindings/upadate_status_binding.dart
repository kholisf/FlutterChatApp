import 'package:get/get.dart';

import '../controllers/upadate_status_controller.dart';

class UpadateStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpadateStatusController>(
      () => UpadateStatusController(),
    );
  }
}
