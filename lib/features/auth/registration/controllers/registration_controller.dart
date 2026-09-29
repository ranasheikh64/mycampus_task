import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/utils/custom_snackbar.dart';
import '../../../../../app/routes/app_pages.dart';

class RegistrationController extends GetxController {
  final formKey = GlobalKey<FormState>();
  
  final nameController = TextEditingController();
  final studentIdController = TextEditingController();
  final emailController = TextEditingController();
  final departmentController = TextEditingController(text: 'Department of Computer Science & Engineering');
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  
  final isObscure = true.obs;
  final isConfirmObscure = true.obs;
  final agreeTerms = false.obs;
  
  final passwordStrength = 0.0.obs;

  final selectedImage = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80, // Optional: compress slightly
      );
      if (image != null) {
        selectedImage.value = File(image.path);
      }
    } catch (e) {
      CustomSnackbar.showError(
        title: 'Error',
        message: 'Failed to pick image: $e',
      );
    }
  }

  final List<String> departments = [
    'Department of Computer Science & Engineering',
    'Department of Electrical Engineering',
    'Department of Mechanical Engineering',
    'Department of Civil Engineering',
    'Department of Business Administration',
  ];

  @override
  void onInit() {
    super.onInit();
    passwordController.addListener(_updatePasswordStrength);
  }

  void _updatePasswordStrength() {
    String password = passwordController.text;
    double strength = 0.0;
    if (password.isEmpty) {
      passwordStrength.value = 0.0;
      return;
    }
    if (password.length >= 8) strength += 0.25;
    if (RegExp(r'[A-Z]').hasMatch(password)) strength += 0.25;
    if (RegExp(r'[0-9]').hasMatch(password)) strength += 0.25;
    if (RegExp(r'[^a-zA-Z0-9]').hasMatch(password)) strength += 0.25;
    passwordStrength.value = strength;
  }

  @override
  void onClose() {
    passwordController.removeListener(_updatePasswordStrength);
    nameController.dispose();
    studentIdController.dispose();
    emailController.dispose();
    departmentController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void toggleObscure() => isObscure.value = !isObscure.value;
  void toggleConfirmObscure() => isConfirmObscure.value = !isConfirmObscure.value;

  void createAccount() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    if (!agreeTerms.value) {
      CustomSnackbar.showError(
        title: 'Error',
        message: 'Please agree to the terms and policies.',
      );
      return;
    }
    
    // Success scenario
    CustomSnackbar.showSuccess(
      title: 'Success',
      message: 'Account created successfully!',
    );
    Get.offAllNamed(Routes.HOME_MAIN);
  }
}
