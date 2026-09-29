import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/assignment_home_controller.dart';

class AssignmentHomeView extends GetView<AssignmentHomeController> {
  const AssignmentHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AssignmentHomeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AssignmentHomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
