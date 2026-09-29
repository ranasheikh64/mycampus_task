import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/custom_scaffold_bg.dart';
import '../controllers/home_main_controller.dart';
import 'widgets/academic_standing_card.dart';
import 'widgets/campus_announcements_section.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/pending_assignments_section.dart';
import 'widgets/quick_actions_grid.dart';
import 'widgets/todays_schedule_section.dart';
import 'widgets/welcome_section.dart';

class HomeMainView extends GetView<HomeMainController> {
  const HomeMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWithBg(
      appBar: const HomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            WelcomeSection(),
            AcademicStandingCard(),
            QuickActionsGrid(),
            TodaysScheduleSection(),
            PendingAssignmentsSection(),
            CampusAnnouncementsSection(),
          ],
        ),
      ),
    );
  }
}
