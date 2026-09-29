import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/custom_scaffold_bg.dart';
import '../controllers/attendance_home_controller.dart';
import 'widgets/aggregate_standing_card.dart';
import 'widgets/attendance_app_bar.dart';
import 'widgets/attendance_filters.dart';
import 'widgets/course_breakdown_section.dart';
import 'widgets/excused_leave_card.dart';

class AttendanceHomeView extends GetView<AttendanceHomeController> {
  const AttendanceHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWithBg(
      appBar: const AttendanceAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            AggregateStandingCard(),
            AttendanceFilters(),
            CourseBreakdownSection(),
            ExcusedLeaveCard(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
