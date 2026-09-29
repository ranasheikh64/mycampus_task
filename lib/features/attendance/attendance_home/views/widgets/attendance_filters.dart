import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../controllers/attendance_home_controller.dart';

class AttendanceFilters extends GetView<AttendanceHomeController> {
  const AttendanceFilters({super.key});

  @override
  Widget build(BuildContext context) {
    // Keys to identify each chip for scrolling
    final List<GlobalKey> keys = [GlobalKey(), GlobalKey(), GlobalKey()];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'FILTER BY TYPE',
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                  letterSpacing: 0.5,
                ),
              ),
              Text(
                '5 Enrolled',
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mdPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          SingleChildScrollView(
            controller: controller.filterScrollController,
            scrollDirection: Axis.horizontal,
            child: Obx(
              () => Row(
                children: [
                  _buildFilterChip(
                    key: keys[0],
                    label: 'All Subjects',
                    badgeText: '5',
                    isSelected: controller.selectedFilterIndex.value == 0,
                    onTap: () {
                      controller.changeFilter(0);
                      _scrollTo(keys[0]);
                    },
                  ),
                  SizedBox(width: 8.w),
                  _buildFilterChip(
                    key: keys[1],
                    label: 'Lectures (4)',
                    badgeText: null,
                    isSelected: controller.selectedFilterIndex.value == 1,
                    onTap: () {
                      controller.changeFilter(1);
                      _scrollTo(keys[1]);
                    },
                  ),
                  SizedBox(width: 8.w),
                  _buildFilterChip(
                    key: keys[2],
                    label: 'Practical Labs (1)',
                    badgeText: null,
                    isSelected: controller.selectedFilterIndex.value == 2,
                    onTap: () {
                      controller.changeFilter(2);
                      _scrollTo(keys[2]);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _scrollTo(GlobalKey key) {
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 300),
        alignment: 0.5, // Center the item
      );
    }
  }

  Widget _buildFilterChip({
    required Key key,
    required String label,
    required String? badgeText,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      key: key,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.mdInverseSurface : AppColors.surface,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected ? Colors.transparent : AppColors.subtleBorder,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected ? AppColors.surface : AppColors.textPrimary,
              ),
            ),
            if (badgeText != null) ...[
              SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.all(4.r),
                decoration: BoxDecoration(
                  color: AppColors.surface.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  badgeText,
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: AppColors.surface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
