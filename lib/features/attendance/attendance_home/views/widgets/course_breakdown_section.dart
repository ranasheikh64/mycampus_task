import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/theme/app_colors.dart';

class CourseBreakdownSection extends StatelessWidget {
  const CourseBreakdownSection({super.key});

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
              Text(
                'Course Breakdown',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                'Tap card for history',
                style: TextStyle(
                  fontSize: 10.sp,
                  color: AppColors.secondaryText,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          _buildCourseCard(
            courseCode: 'CS 302',
            title: 'Distributed Systems',
            percentage: '96%',
            attendance: '24/25 Attended',
            progress: 0.96,
            profInitials: 'AV',
            profName: 'Prof. Aris Vance',
            badgeText: 'Safe • 1 Absent',
            badgeIcon: Icons.check_circle_outline,
            badgeColor: AppColors.success,
            lastUpdated: 'Last: Today, 10:30 AM',
            color: AppColors.primary,
          ),
          SizedBox(height: 12.h),
          _buildCourseCard(
            courseCode: 'MATH 240',
            title: 'Linear Algebra',
            percentage: '91.6%',
            attendance: '22/24 Attended',
            progress: 0.916,
            profInitials: 'ER',
            profName: 'Dr. Elena Rostova',
            badgeText: 'Good Standing',
            badgeColor: AppColors.primary,
            lastUpdated: 'Last: Yesterday, 02:00 PM',
            color: AppColors.primary,
          ),
          SizedBox(height: 12.h),
          _buildCourseCard(
            courseCode: 'CS 341',
            title: 'Operating Systems Lab',
            percentage: '100%',
            attendance: '12/12 Sessions',
            progress: 1.0,
            profInitials: 'MW',
            profName: 'Dr. Marcus Wei',
            badgeText: 'Perfect Record',
            badgeIcon: Icons.star,
            badgeColor: AppColors.success,
            lastUpdated: 'Last: Monday, 09:00 AM',
            color: AppColors.success,
            isLab: true,
          ),
          SizedBox(height: 12.h),
          _buildCourseCard(
            courseCode: 'ENG 201',
            title: 'Technical Writing',
            percentage: '88.8%',
            attendance: '14/18 Attended',
            progress: 0.888,
            profInitials: 'SJ',
            profName: 'Prof. Sarah Jenkins',
            badgeText: 'Good Standing',
            badgeColor: AppColors.primary,
            lastUpdated: 'Last: Oct 24, 11:15 AM',
            color: AppColors.primary,
          ),
          SizedBox(height: 12.h),
          _buildCourseCard(
            courseCode: 'CS 310',
            title: 'Database Management',
            percentage: '78.5%',
            attendance: '11/14 Attended',
            progress: 0.785,
            profInitials: 'KR',
            profName: 'Dr. K. Raman',
            badgeText: 'Borderline Alert',
            badgeIcon: Icons.warning_amber_rounded,
            badgeColor: AppColors.error,
            lastUpdated: 'Last: Oct 23, 03:30 PM',
            color: AppColors.error,
            hasAttention: true,
          ),
        ],
      ),
    );
  }

  Widget _buildCourseCard({
    required String courseCode,
    required String title,
    required String percentage,
    required String attendance,
    required double progress,
    required String profInitials,
    required String profName,
    required String badgeText,
    IconData? badgeIcon,
    required Color badgeColor,
    required String lastUpdated,
    required Color color,
    bool isLab = false,
    bool hasAttention = false,
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
        border: Border.all(color: AppColors.subtleBorder),
      ),
      child: Row(
        children: [
          Container(
            width: 4.w,
            height: hasAttention ? 160.h : 130.h,
            decoration: BoxDecoration(
              color: color,
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
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.secondaryText,
                            ),
                          ),
                          if (isLab) ...[
                            SizedBox(width: 4.w),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                              decoration: BoxDecoration(
                                color: AppColors.mdSurfaceContainer,
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              child: Text(
                                'LAB',
                                style: TextStyle(
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      Text(
                        percentage,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        attendance,
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.r),
                    child: LinearProgressIndicator(
                      value: progress,
                      backgroundColor: color.withOpacity(0.2),
                      valueColor: AlwaysStoppedAnimation<Color>(color),
                      minHeight: 6.h,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 10.r,
                            backgroundColor: AppColors.mdPrimary.withOpacity(0.1),
                            child: Text(
                              profInitials,
                              style: TextStyle(
                                fontSize: 8.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mdPrimary,
                              ),
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            profName,
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: AppColors.secondaryText,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: badgeColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          children: [
                            if (badgeIcon != null) ...[
                              Icon(badgeIcon, size: 10.sp, color: badgeColor),
                              SizedBox(width: 4.w),
                            ],
                            Text(
                              badgeText,
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                                color: badgeColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (hasAttention) ...[
                    SizedBox(height: 12.h),
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: AppColors.error.withOpacity(0.05),
                        border: Border.all(color: AppColors.error.withOpacity(0.3)),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.info_outline, color: AppColors.error, size: 12.sp),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                text: 'Attention: ',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.error,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Missing 1 more session drops your attendance below the mandatory 75% final examination threshold.',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        lastUpdated,
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: AppColors.secondaryText,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'View Log',
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.mdPrimary,
                            ),
                          ),
                          Icon(Icons.chevron_right, size: 14.sp, color: AppColors.mdPrimary),
                        ],
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
