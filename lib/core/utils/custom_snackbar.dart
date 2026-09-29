import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_colors.dart';

class CustomSnackbar {
  /// Shows a success snackbar (Green)
  static void showSuccess({required String message, String title = 'Success'}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.success,
      colorText: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      borderRadius: 16.r,
      icon: const Icon(Icons.check_circle, color: Colors.white),
      duration: const Duration(seconds: 3),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
      snackStyle: SnackStyle.FLOATING,
    );
  }

  /// Shows an error snackbar (Red)
  static void showError({required String message, String title = 'Error'}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.error,
      colorText: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      borderRadius: 16.r,
      icon: const Icon(Icons.error_outline, color: Colors.white),
      duration: const Duration(seconds: 3),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
      snackStyle: SnackStyle.FLOATING,
    );
  }

  /// Shows an info or warning snackbar
  static void showInfo({required String message, String title = 'Info'}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.mdSecondaryContainer,
      colorText: AppColors.mdOnSecondaryContainer,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      borderRadius: 16.r,
      icon: Icon(Icons.info_outline, color: AppColors.mdOnSecondaryContainer),
      duration: const Duration(seconds: 3),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
      snackStyle: SnackStyle.FLOATING,
    );
  }
}
