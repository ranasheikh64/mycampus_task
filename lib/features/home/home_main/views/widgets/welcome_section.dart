import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/theme/app_colors.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Good morning, Alex 👋',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.mdPrimaryContainer.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Text(
                  'Week 8',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.mdPrimary,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            'Computer Science • Year 3 • Spring 2025',
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.secondaryText,
            ),
          ),
        ],
      ),
    );
  }
}
