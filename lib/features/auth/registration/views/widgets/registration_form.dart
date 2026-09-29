import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../controllers/registration_controller.dart';

class RegistrationForm extends GetView<RegistrationController> {
  const RegistrationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar Picker
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 24,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: controller.pickImage,
                  child: Stack(
                    children: [
                      Obx(
                        () => Container(
                          width: 100.w,
                          height: 100.w,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                            image: controller.selectedImage.value != null
                                ? DecorationImage(
                                    image: FileImage(
                                      controller.selectedImage.value!,
                                    ),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                          child: controller.selectedImage.value == null
                              ? Center(
                                  child: Icon(
                                    Icons.person_outline,
                                    size: 40.sp,
                                    color: AppColors.secondaryText,
                                  ),
                                )
                              : null,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 32.w,
                          height: 32.w,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withOpacity(0.4),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 16.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  'Upload Student Photo',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'JPG or PNG, max 5MB for Digital ID verification',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: AppColors.mdOnSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),

          _buildLabel('Full Name'),
          CustomTextField(
            controller: controller.nameController,
            hintText: 'e.g. Alex Rivers',
            prefixIcon: const Icon(
              Icons.person_outline,
              color: AppColors.mdOutline,
            ),
            validator: (v) =>
                (v == null || v.isEmpty) ? 'Please enter your name' : null,
          ),
          SizedBox(height: 16.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildLabel('Student ID / Enrolment No.'),
              // Text(
              //   'Verify via Registrar',
              //   style: TextStyle(
              //     fontSize: 10.sp,
              //     fontWeight: FontWeight.w500,
              //     color: AppColors.mdSecondary,
              //   ),
              // ),
            ],
          ),
          CustomTextField(
            controller: controller.studentIdController,
            hintText: 'E.G. CS-9428 OR 20250912',
            prefixIcon: const Icon(
              Icons.badge_outlined,
              color: AppColors.mdOutline,
            ),
            validator: (v) => (v == null || v.isEmpty)
                ? 'Please enter your student ID'
                : null,
          ),
          SizedBox(height: 16.h),

          _buildLabel('University / Campus Email'),
          CustomTextField(
            controller: controller.emailController,
            hintText: 'alex.rivers@campus.edu',
            prefixIcon: const Icon(
              Icons.alternate_email,
              color: AppColors.mdOutline,
            ),
            validator: (v) =>
                (v == null || v.isEmpty) ? 'Please enter your email' : null,
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Icon(
                Icons.info_outline,
                size: 12.sp,
                color: AppColors.mdOnSurfaceVariant,
              ),
              SizedBox(width: 4.w),
              Text(
                'Use your official institution email domain',
                style: TextStyle(
                  fontSize: 10.sp,
                  color: AppColors.mdOnSurfaceVariant,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          _buildLabel('Department / Major'),
          PopupMenuButton<String>(
            onSelected: (String value) {
              controller.departmentController.text = value;
            },
            itemBuilder: (BuildContext context) {
              return controller.departments.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
            offset: const Offset(0, 50),
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: IgnorePointer(
              child: CustomTextField(
                controller: controller.departmentController,
                hintText: 'Select Department',
                prefixIcon: const Icon(Icons.business, color: AppColors.mdOutline),
                suffixIcon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.mdOutline,
                ),
                readOnly: true,
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Please select a department' : null,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          _buildLabel('Password'),
          Obx(
            () => CustomTextField(
              controller: controller.passwordController,
              hintText: 'CampusSec!2025',
              obscureText: controller.isObscure.value,
              prefixIcon: const Icon(
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
              validator: (v) =>
                  (v == null || v.isEmpty) ? 'Please enter a password' : null,
            ),
          ),
          SizedBox(height: 8.h),
          Obx(() {
            final strength = controller.passwordStrength.value;
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 6.h,
                    decoration: BoxDecoration(
                      color: strength >= 0.25
                          ? Colors.green
                          // ignore: deprecated_member_use
                          : AppColors.mdOutlineVariant.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(99.r),
                    ),
                  ),
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: Container(
                    height: 6.h,
                    decoration: BoxDecoration(
                      color: strength >= 0.50
                          ? Colors.green
                          // ignore: deprecated_member_use
                          : AppColors.mdOutlineVariant.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(99.r),
                    ),
                  ),
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: Container(
                    height: 6.h,
                    decoration: BoxDecoration(
                      color: strength >= 0.75
                          ? Colors.green
                          // ignore: deprecated_member_use
                          : AppColors.mdOutlineVariant.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(99.r),
                    ),
                  ),
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: Container(
                    height: 6.h,
                    decoration: BoxDecoration(
                      color: strength >= 1.0
                          ? Colors.green
                          // ignore: deprecated_member_use
                          : AppColors.mdOutlineVariant.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(99.r),
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Icon(
                  strength >= 1.0
                      ? Icons.check_circle_outline
                      : Icons.info_outline,
                  size: 12.sp,
                  color: strength >= 1.0 ? Colors.green : AppColors.mdOutline,
                ),
                SizedBox(width: 4.w),
                Text(
                  strength >= 1.0
                      ? 'Strong Password'
                      : strength >= 0.5
                      ? 'Good Password'
                      : 'Weak Password',
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700,
                    color: strength >= 1.0
                        ? Colors.green
                        : (strength >= 0.5
                              ? Colors.orange
                              : AppColors.mdOutline),
                  ),
                ),
              ],
            );
          }),
          SizedBox(height: 16.h),

          _buildLabel('Confirm Password'),
          Obx(
            () => CustomTextField(
              controller: controller.confirmPasswordController,
              hintText: 'CampusSec!2025',
              obscureText: controller.isConfirmObscure.value,
              prefixIcon: const Icon(
                Icons.lock_reset,
                color: AppColors.mdOutline,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  controller.isConfirmObscure.value
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: AppColors.mdOutline,
                ),
                onPressed: controller.toggleConfirmObscure,
              ),
              validator: (v) => (v != controller.passwordController.text)
                  ? 'Passwords do not match'
                  : null,
            ),
          ),
          SizedBox(height: 16.h),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Checkbox(
                  value: controller.agreeTerms.value,
                  onChanged: (val) =>
                      controller.agreeTerms.value = val ?? false,
                  activeColor: AppColors.mdSecondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 12.h),
                  child: Text.rich(
                    TextSpan(
                      text: 'I agree to the ',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.mdOnSurfaceVariant,
                      ),
                      children: const [
                        TextSpan(
                          text: 'Campus Acceptable Use Policy',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: AppColors.mdSecondary,
                          ),
                        ),
                        TextSpan(text: ', '),
                        TextSpan(
                          text: 'Digital ID Terms',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: AppColors.mdSecondary,
                          ),
                        ),
                        TextSpan(text: ', and university privacy protocols.'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}
