import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/widgets/custom_scaffold_bg.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/app_assets.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Ensure the controller is initialized so onInit runs
    Get.put(SplashController());
    return CustomScaffoldWithBg(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 3),
            // Logo and Title Section
            Center(
              child: Column(
                children: [
                  // Actual Figma Logo SVG
                  Container(
                    width: 96.w,
                    height: 96.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.r),
                      border: Border.all(
                        color: AppColors.mdOutlineVariant.withOpacity(0.4),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.15),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        )
                      ],
                    ),
                    child: Center(
                      child: Container(
                        width: 64.w,
                        height: 64.w,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [AppColors.mdSecondary, AppColors.primary],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            AppAssets.logo,
                            width: 30.w,
                            height: 27.h,
                            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    'MyCampus',
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                      letterSpacing: -0.65,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Your Campus, Connected',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.mdOnSurfaceVariant,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(999.r),
                      border: Border.all(color: AppColors.mdOutlineVariant.withOpacity(0.5)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 1,
                          offset: const Offset(0, 1),
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          AppAssets.gradCap,
                          width: 13.w,
                          height: 11.h,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          'SMART STUDENT PORTAL',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.mdOnSurfaceVariant,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 2),
            // Bottom Loading and Footer
            Column(
              children: [
                // Minimalist Dynamic Loading Bar
                Container(
                  width: 192.w,
                  height: 6.h,
                  decoration: BoxDecoration(
                    color: AppColors.mdSurfaceContainerHighest,
                    borderRadius: BorderRadius.circular(999.r),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 0.0, end: 1.0),
                      duration: const Duration(seconds: 3), // Matches the controller's 3-second delay
                      builder: (context, value, child) {
                        return Container(
                          width: 192.w * value,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(999.r),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withOpacity(0.6),
                                blurRadius: 10,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  'Synchronizing campus data...',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.mdOutline,
                  ),
                ),
                SizedBox(height: 32.h),
                Text(
                  'Empowering Student Success',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.mdOnSurfaceVariant,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Version 2.4.0',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.mdOutline,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Text(
                        '•',
                        style: TextStyle(
                          fontSize: 8.sp,
                          color: AppColors.mdOutline,
                        ),
                      ),
                    ),
                    Text(
                      'Build 842',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.mdOutline,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
