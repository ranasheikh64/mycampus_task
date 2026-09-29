import 'package:get/get.dart';

import '../controllers/profile_home_controller.dart';

class ProfileHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileHomeController>(
      () => ProfileHomeController(),
    );
  }
}
