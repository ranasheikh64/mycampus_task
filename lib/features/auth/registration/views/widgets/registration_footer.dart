import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';

class RegistrationFooter extends StatelessWidget {
  final VoidCallback onCreateAccount;
  const RegistrationFooter({super.key, required this.onCreateAccount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          text: 'Create Account',
          onPressed: onCreateAccount,
          suffixIcon: const Icon(Icons.arrow_forward),
        ),
        SizedBox(height: 24.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already registered? ',
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.mdOnSurfaceVariant,
              ),
            ),
            GestureDetector(
              onTap: () => Get.back(),
              child: Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.mdSecondary,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Divider(color: AppColors.mdOutlineVariant.withOpacity(0.3)),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.headset_mic_outlined, size: 12.sp, color: AppColors.mdOnSurfaceVariant),
            SizedBox(width: 4.w),
            Text(
              'Need registration assistance?',
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.mdOnSurfaceVariant,
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Text(
          'Contact Registrar Office & IT Desk',
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.mdSecondary,
          ),
        ),
        SizedBox(height: 32.h),
      ],
    );
  }
}
