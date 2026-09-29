import 'package:get/get.dart';

import '../controllers/main_bottom_navigationbar_controller.dart';

class MainBottomNavigationbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainBottomNavigationbarController>(
      () => MainBottomNavigationbarController(),
    );
  }
}
