import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_home_controller.dart';

class ProfileHomeView extends GetView<ProfileHomeController> {
  const ProfileHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileHomeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProfileHomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
