import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/widgets/custom_scaffold_bg.dart';
import '../controllers/registration_controller.dart';
import 'widgets/registration_header.dart';
import 'widgets/registration_form.dart';
import 'widgets/registration_footer.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWithBg(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              const RegistrationHeader(),
              const RegistrationForm(),
              RegistrationFooter(
                onCreateAccount: controller.createAccount,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
