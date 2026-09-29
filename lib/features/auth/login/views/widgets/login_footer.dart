import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../app/routes/app_pages.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'New Student? ',
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.mdOnSurfaceVariant,
              ),
            ),
            GestureDetector(
              onTap: () => Get.toNamed(Routes.REGISTRATION),
              child: Text(
                'Activate Account',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mdSecondary,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.headset_mic_outlined,
              size: 12.sp,
              color: AppColors.mdOnSurfaceVariant,
            ),
            SizedBox(width: 4.w),
            Text(
              'Need help? Contact Campus IT Support',
              style: TextStyle(
                fontSize: 11.sp,
                color: AppColors.mdOnSurfaceVariant,
              ),
            ),
          ],
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}
