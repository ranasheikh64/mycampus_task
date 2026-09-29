import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/widgets/custom_button.dart';

class PendingAssignmentsSection extends StatelessWidget {
  const PendingAssignmentsSection({super.key});

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
                    'Pending Assignments',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Container(
                    width: 6.r,
                    height: 6.r,
                    decoration: const BoxDecoration(
                      color: AppColors.error,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              Text(
                '2 Tasks Due',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.secondaryText,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          _buildAssignmentCard(
            courseCode: 'DISTRIBUTED SYSTEMS',
            title: 'Lab 3: Raft Consensus Engine',
            dueText: 'Due Today, 11:59 PM',
            isDueToday: true,
            priority: 'High Priority',
            isHighPriority: true,
            actionWidget: SizedBox(
              height: 28.h,
              width: 80.w,
              child: CustomButton(
                text: 'Submit',
                onPressed: () {},
                // The button in figma is filled primary blue
              ),
            ),
          ),
          SizedBox(height: 12.h),
          _buildAssignmentCard(
            courseCode: 'LINEAR ALGEBRA',
            title: 'Problem Set 4: Vector Orthogonality',
            dueText: 'Due Tomorrow, 5:00 PM',
            isDueToday: false,
            priority: 'Normal',
            isHighPriority: false,
            actionWidget: Text(
              'PDF Upload',
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAssignmentCard({
    required String courseCode,
    required String title,
    required String dueText,
    required bool isDueToday,
    required String priority,
    required bool isHighPriority,
    required Widget actionWidget,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.subtleBorder),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 20.w,
            height: 20.w,
            margin: EdgeInsets.only(top: 2.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(color: AppColors.mdOutlineVariant),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      courseCode,
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.mdPrimary,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: isHighPriority ? AppColors.error.withOpacity(0.1) : AppColors.mdSurfaceContainer,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        priority,
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: isHighPriority ? AppColors.error : AppColors.secondaryText,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          isDueToday ? Icons.calendar_today : Icons.access_time,
                          size: 12.sp,
                          color: isDueToday ? AppColors.error : AppColors.secondaryText,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          dueText,
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: isDueToday ? AppColors.error : AppColors.secondaryText,
                          ),
                        ),
                      ],
                    ),
                    actionWidget,
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
