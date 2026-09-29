import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: AppColors.mdOnPrimary,
        primaryContainer: AppColors.mdPrimaryContainer,
        onPrimaryContainer: AppColors.mdOnPrimaryContainer,
        secondary: AppColors.mdSecondary,
        onSecondary: AppColors.mdOnSecondary,
        secondaryContainer: AppColors.mdSecondaryContainer,
        onSecondaryContainer: AppColors.mdOnSecondaryContainer,
        tertiary: AppColors.mdTertiary,
        onTertiary: AppColors.mdOnTertiary,
        tertiaryContainer: AppColors.mdTertiaryContainer,
        onTertiaryContainer: AppColors.mdOnTertiaryContainer,
        error: AppColors.error,
        onError: AppColors.mdOnError,
        errorContainer: AppColors.mdErrorContainer,
        onErrorContainer: AppColors.mdOnErrorContainer,
        surface: AppColors.surface,
        onSurface: AppColors.mdOnSurface,
        outline: AppColors.mdOutline,
        outlineVariant: AppColors.mdOutlineVariant,
      ),
      scaffoldBackgroundColor: AppColors.canvas,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      fontFamily: 'Plus Jakarta Sans',
    );
  }
}
