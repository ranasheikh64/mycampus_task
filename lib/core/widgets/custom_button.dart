import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_colors.dart';

enum ButtonType { primary, outlined, text }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonType type;
  final bool isLoading;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;

  const CustomButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.type = ButtonType.primary,
    this.isLoading = false,
    this.prefixIcon,
    this.suffixIcon,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 56.h,
      child: _buildButton(),
    );
  }

  Widget _buildButton() {
    switch (type) {
      case ButtonType.primary:
        return _buildPrimaryButton();
      case ButtonType.outlined:
        return _buildOutlinedButton();
      case ButtonType.text:
        return _buildTextButton();
    }
  }

  Widget _buildPrimaryButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9999.r),
        boxShadow: onPressed == null || isLoading
            ? null
            : [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.35),
                  offset: const Offset(0, 8),
                  blurRadius: 24,
                  spreadRadius: -2,
                ),
              ],
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          foregroundColor: textColor ?? AppColors.surface,
          elevation: 0,
          padding: padding ?? EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9999.r),
          ),
        ),
        child: _buildChild(textColor ?? AppColors.surface),
      ),
    );
  }

  Widget _buildOutlinedButton() {
    return OutlinedButton(
      onPressed: isLoading ? null : onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: textColor ?? AppColors.textPrimary,
        side: BorderSide(
          color: AppColors.mdOutlineVariant,
          width: 1,
        ),
        padding: padding ?? EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9999.r),
        ),
      ),
      child: _buildChild(textColor ?? AppColors.textPrimary),
    );
  }

  Widget _buildTextButton() {
    return TextButton(
      onPressed: isLoading ? null : onPressed,
      style: TextButton.styleFrom(
        foregroundColor: textColor ?? AppColors.textPrimary,
        padding: padding ?? EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9999.r),
        ),
      ),
      child: _buildChild(textColor ?? AppColors.textPrimary),
    );
  }

  Widget _buildChild(Color color) {
    if (isLoading) {
      return SizedBox(
        width: 24.w,
        height: 24.w,
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (prefixIcon != null) ...[
          prefixIcon!,
          SizedBox(width: 8.w),
        ],
        Flexible(
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Plus Jakarta Sans',
              color: color,
              letterSpacing: 0.14,
            ),
          ),
        ),
        if (suffixIcon != null) ...[
          SizedBox(width: 8.w),
          suffixIcon!,
        ],
      ],
    );
  }
}
