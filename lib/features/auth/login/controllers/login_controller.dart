import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../app/routes/app_pages.dart';
import '../../../../../core/utils/custom_snackbar.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  final isObscure = true.obs;
  final rememberMe = false.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void toggleObscure() {
    isObscure.value = !isObscure.value;
  }

  void signIn() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    
    // Simulate Login
    CustomSnackbar.showSuccess(
      title: 'Success',
      message: 'Logged in successfully!',
    );
    Get.offAllNamed(Routes.MAIN_BOTTOM_NAVIGATIONBAR);
  }
}
