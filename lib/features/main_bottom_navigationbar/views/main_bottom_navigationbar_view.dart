import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../attendance/attendance_home/views/attendance_home_view.dart';
import '../../home/home_main/views/home_main_view.dart';
import '../controllers/main_bottom_navigationbar_controller.dart';

class MainBottomNavigationbarView
    extends GetView<MainBottomNavigationbarController> {
  const MainBottomNavigationbarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.canvas,
      body: Obx(() => _buildBody(controller.selectedIndex.value)),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildNavItem(
                    index: 0,
                    icon: Icons.home_filled,
                    unselectedIcon: Icons.home_outlined,
                    label: 'Home',
                  ),
                  _buildNavItem(
                    index: 1,
                    icon: Icons.calendar_month,
                    unselectedIcon: Icons.calendar_month_outlined,
                    label: 'Routine',
                  ),
                  _buildNavItem(
                    index: 2,
                    icon: Icons.fact_check,
                    unselectedIcon: Icons.fact_check_outlined,
                    label: 'Attendance',
                  ),
                  _buildNavItem(
                    index: 3,
                    icon: Icons.assignment,
                    unselectedIcon: Icons.assignment_outlined,
                    label: 'Assignments',
                  ),
                  _buildNavItem(
                    index: 4,
                    icon: Icons.person,
                    unselectedIcon: Icons.person_outline,
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(int index) {
    // Return placeholder pages for now
    switch (index) {
      case 0:
        return const HomeMainView();
      case 1:
        return const Center(child: Text('Routine Page'));
      case 2:
        return const AttendanceHomeView();
      case 3:
        return const Center(child: Text('Assignments Page'));
      case 4:
        return const Center(child: Text('Profile Page'));
      default:
        return const HomeMainView();
    }
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required IconData unselectedIcon,
    required String label,
  }) {
    final isSelected = controller.selectedIndex.value == index;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => controller.changeIndex(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isSelected ? icon : unselectedIcon,
            color: isSelected ? AppColors.mdPrimary : AppColors.secondaryText,
            size: 24.sp,
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              color: isSelected ? AppColors.mdPrimary : AppColors.secondaryText,
            ),
          ),
          SizedBox(height: 4.h),
          Container(
            width: 4.w,
            height: 4.w,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : Colors.transparent,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
