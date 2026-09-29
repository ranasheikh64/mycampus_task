import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendanceHomeController extends GetxController {
  final selectedFilterIndex = 0.obs;
  final filterScrollController = ScrollController();

  void changeFilter(int index) {
    selectedFilterIndex.value = index;
  }

  @override
  void onClose() {
    filterScrollController.dispose();
    super.onClose();
  }
}
