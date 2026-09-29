import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/widgets/custom_button.dart';

class TodaysScheduleSection extends StatelessWidget {
  const TodaysScheduleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Today's Schedule",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Container(
                    padding: EdgeInsets.all(6.r),
                    decoration: BoxDecoration(
                      color: AppColors.subtleBorder,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '4',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                'See All (4) >',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mdPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          _buildScheduleCard(
            courseCode: 'CS 302',
            location: 'Hall B • Tech Wing',
            timeInfo: 'In 15 mins',
            title: 'Distributed Systems',
            time: '10:30 AM - 12:00 PM (90 mins)',
            profInitials: 'AV',
            profName: 'Prof. Aris Vance',
            isPrimary: true,
            hasCheckIn: true,
          ),
          SizedBox(height: 12.h),
          _buildScheduleCard(
            courseCode: 'MATH 240',
            location: 'Science Complex 104',
            timeInfo: '02:00 PM - 03:30 PM',
            title: 'Linear Algebra',
            time: '',
            profInitials: 'EL',
            profName: 'Dr. Elena Rostova',
            isPrimary: false,
            hasCheckIn: false,
            badgeLabel: 'Lecture',
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleCard({
    required String courseCode,
    required String location,
    required String timeInfo,
    required String title,
    required String time,
    required String profInitials,
    required String profName,
    required bool isPrimary,
    required bool hasCheckIn,
    String? badgeLabel,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 4.w,
            height: hasCheckIn ? 140.h : 110.h,
            decoration: BoxDecoration(
              color: isPrimary ? AppColors.primary : AppColors.primary.withOpacity(0.4),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                bottomLeft: Radius.circular(16.r),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            courseCode,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                            decoration: BoxDecoration(
                              color: AppColors.mdSurfaceContainerHigh,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Text(
                              location,
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: AppColors.mdOnSurfaceVariant,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: isPrimary ? AppColors.mdPrimary.withOpacity(0.1) : Colors.transparent,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          timeInfo,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: isPrimary ? FontWeight.bold : FontWeight.normal,
                            color: isPrimary ? AppColors.mdPrimary : AppColors.secondaryText,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  if (time.isNotEmpty) ...[
                    SizedBox(height: 4.h),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.secondaryText,
                      ),
                    ),
                  ],
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 12.r,
                            backgroundColor: AppColors.primary.withOpacity(0.2),
                            child: Text(
                              profInitials,
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mdPrimary,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            profName,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.secondaryText,
                            ),
                          ),
                        ],
                      ),
                      if (hasCheckIn)
                        SizedBox(
                          height: 32.h,
                          width: 100.w,
                          child: CustomButton(
                            text: 'Check In',
                            onPressed: () {},
                            suffixIcon: Icon(Icons.person_add_alt_1_outlined),
                          ),
                        )
                      else if (badgeLabel != null)
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: AppColors.mdSurfaceContainer,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            badgeLabel,
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: AppColors.mdOnSurfaceVariant,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
