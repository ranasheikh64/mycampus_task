import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/widgets/custom_scaffold_bg.dart';
import '../controllers/login_controller.dart';
import 'widgets/login_header.dart';
import 'widgets/login_form.dart';
import 'widgets/login_footer.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWithBg(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              const LoginHeader(),
              SizedBox(height: 32.h),
              const LoginForm(),
              SizedBox(height: 48.h),
              const LoginFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
