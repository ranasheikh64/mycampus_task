import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final int maxLines;
  final int? minLines;
  final bool readOnly;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final String? labelText;

  const CustomTextField({
    Key? key,
    this.hintText,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.maxLines = 1,
    this.minLines,
    this.readOnly = false,
    this.onTap,
    this.inputFormatters,
    this.focusNode,
    this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          Text(
            labelText!,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
              fontFamily: 'Plus Jakarta Sans',
            ),
          ),
          SizedBox(height: 8.h),
        ],
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
          onChanged: onChanged,
          maxLines: maxLines,
          minLines: minLines,
          readOnly: readOnly,
          onTap: onTap,
          inputFormatters: inputFormatters,
          focusNode: focusNode,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.textPrimary,
            fontFamily: 'Plus Jakarta Sans',
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 14.sp,
              color: AppColors.mdOutline.withOpacity(0.6), // rgba(110,121,128,0.6)
              fontFamily: 'Plus Jakarta Sans',
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 15.h),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            border: _buildBorder(),
            enabledBorder: _buildBorder(),
            focusedBorder: _buildFocusedBorder(),
            errorBorder: _buildErrorBorder(),
            focusedErrorBorder: _buildErrorBorder(),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(
        color: AppColors.mdOutlineVariant.withOpacity(0.6), // rgba(189,200,209,0.6)
        width: 1,
      ),
    );
  }

  OutlineInputBorder _buildFocusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(
        color: AppColors.primary, // Active border color
        width: 1.5,
      ),
    );
  }

  OutlineInputBorder _buildErrorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(
        color: AppColors.error,
        width: 1.5,
      ),
    );
  }
}
