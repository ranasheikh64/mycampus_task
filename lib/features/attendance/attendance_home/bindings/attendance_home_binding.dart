import 'package:get/get.dart';

import '../controllers/attendance_home_controller.dart';

class AttendanceHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttendanceHomeController>(
      () => AttendanceHomeController(),
    );
  }
}
