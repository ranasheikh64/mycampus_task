import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';

class RegistrationHeader extends StatelessWidget {
  const RegistrationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     GestureDetector(
        //       onTap: () => Get.back(),
        //       child: Container(
        //         width: 40.w,
        //         height: 40.w,
        //         decoration: BoxDecoration(
        //           color: Colors.white,
        //           shape: BoxShape.circle,
        //           border: Border.all(
        //             color: AppColors.mdOutlineVariant.withOpacity(0.4),
        //           ),
        //         ),
        //         child: Center(
        //           child: Icon(
        //             Icons.arrow_back,
        //             size: 20.sp,
        //             color: AppColors.textPrimary,
        //           ),
        //         ),
        //       ),
        //     ),
        //     Column(
        //       children: [
        //         Text(
        //           'STUDENT PORTAL',
        //           style: TextStyle(
        //             fontSize: 10.sp,
        //             fontWeight: FontWeight.w700,
        //             color: AppColors.mdSecondary,
        //             letterSpacing: 0.5,
        //           ),
        //         ),
        //         Text(
        //           'Create Account',
        //           style: TextStyle(
        //             fontSize: 16.sp,
        //             fontWeight: FontWeight.w700,
        //             color: AppColors.textPrimary,
        //           ),
        //         ),
        //       ],
        //     ),
        //     // Container(
        //     //   padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 5.h),
        //     //   decoration: BoxDecoration(
        //     //     color: AppColors.mdSecondaryContainer,
        //     //     borderRadius: BorderRadius.circular(999.r),
        //     //     border: Border.all(color: AppColors.mdOutlineVariant.withOpacity(0.3)),
        //     //   ),
        //     //   child: Row(
        //     //     children: [
        //     //       Container(
        //     //         width: 6.w,
        //     //         height: 6.w,
        //     //         decoration: const BoxDecoration(
        //     //           color: AppColors.primary,
        //     //           shape: BoxShape.circle,
        //     //         ),
        //     //       ),
        //     //       SizedBox(width: 4.w),
        //     //       Text(
        //     //         '1 of 2',
        //     //         style: TextStyle(
        //     //           fontSize: 10.sp,
        //     //           fontWeight: FontWeight.w600,
        //     //           color: AppColors.mdOnSurfaceVariant,
        //     //         ),
        //     //       ),
        //     //     ],
        //     //   ),
        //     // ),
        //   ],
        // ),
        SizedBox(height: 32.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: AppColors.mdSecondaryContainer.withOpacity(0.5),
            borderRadius: BorderRadius.circular(999.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.school, size: 12.sp, color: AppColors.mdSecondary),
              SizedBox(width: 6.w),
              Text(
                'Academic Year 2025/2026',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.mdSecondary,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Join MyCampus',
          style: TextStyle(
            fontSize: 26.sp,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Set up your student account to access courses,\ncampus facilities & digital ID.',
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.mdOnSurfaceVariant,
            height: 1.4,
          ),
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}
