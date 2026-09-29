import 'package:get/get.dart';
import 'package:mycampus/features/attendance/attendance_home/controllers/attendance_home_controller.dart';

import '../controllers/main_bottom_navigationbar_controller.dart';

class MainBottomNavigationbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainBottomNavigationbarController>(
      () => MainBottomNavigationbarController(),
    );
    Get.lazyPut<AttendanceHomeController>(
      () => AttendanceHomeController(),
    );
  }
}
