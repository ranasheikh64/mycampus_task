import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/routine_home_controller.dart';

class RoutineHomeView extends GetView<RoutineHomeController> {
  const RoutineHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RoutineHomeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RoutineHomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
