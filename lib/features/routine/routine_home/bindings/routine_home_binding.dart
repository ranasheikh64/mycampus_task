import 'package:get/get.dart';

import '../controllers/routine_home_controller.dart';

class RoutineHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoutineHomeController>(
      () => RoutineHomeController(),
    );
  }
}
