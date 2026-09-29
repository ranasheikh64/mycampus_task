import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../controllers/login_controller.dart';
import '../../../../../app/routes/app_pages.dart';

class LoginForm extends GetView<LoginController> {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: AppColors.mdOutlineVariant.withOpacity(0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Segmented Switcher (Mock)
            Container(
              height: 48.h,
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: AppColors.mdSurfaceContainer,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 1,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.school_outlined,
                              size: 14.sp,
                              color: AppColors.textPrimary,
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              'Student',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.badge_outlined,
                            size: 14.sp,
                            color: AppColors.mdOnSurfaceVariant,
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            'Faculty & Staff',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.mdOnSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              'STUDENT ID OR CAMPUS EMAIL',
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 8.h),
            CustomTextField(
              controller: controller.emailController,
              hintText: 'e.g. alex.rivers@campus.edu',
              prefixIcon: Icon(
                Icons.alternate_email,
                color: AppColors.mdOutline,
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your email or student ID';
                }
                return null;
              },
            ),
            SizedBox(height: 16.h),
            Text(
              'PASSWORD',
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 8.h),
            Obx(
              () => CustomTextField(
                controller: controller.passwordController,
                hintText: 'Enter your campus password',
                obscureText: controller.isObscure.value,
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: AppColors.mdOutline,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.isObscure.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.mdOutline,
                  ),
                  onPressed: controller.toggleObscure,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (val) =>
                            controller.rememberMe.value = val ?? false,
                        activeColor: AppColors.mdSecondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                    ),
                    Text(
                      'Remember Me',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.mdOnSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(Routes.FORGET_PASSWORD),
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mdSecondary,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            CustomButton(
              text: 'Sign In',
              onPressed: controller.signIn,
              suffixIcon: Icon(Icons.arrow_forward),
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: AppColors.mdOutlineVariant.withOpacity(0.5),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Text(
                    'Or sign in with',
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.mdOnSurfaceVariant,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: AppColors.mdOutlineVariant.withOpacity(0.5),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    type: ButtonType.outlined,
                    text: 'Biometrics',
                    prefixIcon: Icon(
                      Icons.fingerprint,
                      color: AppColors.textPrimary,
                      size: 18.sp,
                    ),
                    height: 44.h,
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: CustomButton(
                    type: ButtonType.outlined,
                    text: 'Campus SSO',
                    prefixIcon: Icon(
                      Icons.security,
                      color: AppColors.textPrimary,
                      size: 18.sp,
                    ),
                    height: 44.h,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
