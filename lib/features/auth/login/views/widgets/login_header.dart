import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/constants/app_assets.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 60.h),
        // Logo Squircle
        Container(
          width: 64.w,
          height: 64.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22.r),
            border: Border.all(color: AppColors.mdOutlineVariant.withOpacity(0.4)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 20,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: Center(
            child: Container(
              width: 56.w,
              height: 56.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.mdSurfaceContainer, AppColors.primary.withOpacity(0.2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(18.r),
              ),
              child: Center(
                child: SvgPicture.asset(
                  AppAssets.logo,
                  width: 26.w,
                  height: 26.w,
                  colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 16.h),
        // Welcome Text
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'MyCampus',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              TextSpan(
                text: '.',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          'Welcome Back',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Sign in to access your student portal, courses &\ncampus services',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.mdOnSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
