import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/theme/app_colors.dart';

class CampusAnnouncementsSection extends StatelessWidget {
  const CampusAnnouncementsSection({super.key});

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
                'Campus Announcements',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                'View All',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mdPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          _buildAnnouncementCard(
            icon: Icons.campaign_outlined,
            isPrimaryIcon: true,
            badgeLabel: 'Academics',
            timeInfo: '2h ago',
            title: 'Midterm Exam Schedule Released',
            description: 'The centralized exam schedule for Spring 2025 is now live. Check room allocations and...',
            actionWidget: Row(
              children: [
                Text(
                  'Download Schedule PDF',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.mdPrimary,
                  ),
                ),
                SizedBox(width: 4.w),
                Icon(Icons.download, size: 14.sp, color: AppColors.mdPrimary),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          _buildAnnouncementCard(
            icon: Icons.local_library_outlined,
            isPrimaryIcon: false,
            badgeLabel: 'Facilities',
            timeInfo: 'Yesterday',
            title: 'Library 24/7 Extended Hours',
            description: 'Main campus library floors 1-3 will remain open continuously throughout Finals prep starting this Friday.',
          ),
          SizedBox(height: 32.h), // padding at bottom
        ],
      ),
    );
  }

  Widget _buildAnnouncementCard({
    required IconData icon,
    required bool isPrimaryIcon,
    required String badgeLabel,
    required String timeInfo,
    required String title,
    required String description,
    Widget? actionWidget,
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
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: isPrimaryIcon ? AppColors.mdPrimary.withOpacity(0.1) : AppColors.mdSurfaceContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 20.sp,
              color: isPrimaryIcon ? AppColors.mdPrimary : AppColors.secondaryText,
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
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: isPrimaryIcon ? AppColors.mdPrimary.withOpacity(0.1) : AppColors.mdSurfaceContainer,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        badgeLabel,
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: isPrimaryIcon ? AppColors.mdPrimary : AppColors.secondaryText,
                        ),
                      ),
                    ),
                    Text(
                      timeInfo,
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: AppColors.secondaryText,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.secondaryText,
                    height: 1.4,
                  ),
                ),
                if (actionWidget != null) ...[
                  SizedBox(height: 12.h),
                  actionWidget,
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
