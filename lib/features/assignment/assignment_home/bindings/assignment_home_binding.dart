import 'package:get/get.dart';

import '../controllers/assignment_home_controller.dart';

class AssignmentHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssignmentHomeController>(
      () => AssignmentHomeController(),
    );
  }
}
