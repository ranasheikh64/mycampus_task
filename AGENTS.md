# MyCampus - AI Coding Guidelines

These rules MUST be strictly followed when writing or modifying code for this Flutter project.

## 1. Core UI Components
- **Scaffolding**: Every screen MUST be wrapped with `CustomScaffoldWithBg` from `lib/core/widgets/custom_scaffold_bg.dart` instead of the default `Scaffold`.
- **Buttons**: Always use `CustomButton` (`lib/core/widgets/custom_button.dart`) for primary, outlined, or text buttons.
- **Text Fields**: Always use `CustomTextField` (`lib/core/widgets/custom_text_field.dart`) for all inputs.
- **Colors**: Always use the predefined colors in `AppColors` (`lib/core/theme/app_colors.dart`). Do not use raw hex colors or default `Colors.*` unless absolutely necessary.
- **Snackbars**: Use `CustomSnackbar` (`lib/core/utils/custom_snackbar.dart`) for all notifications.

## 2. Asset Management
- Always download required images/icons from Figma to the local `assets/` directory.
- ALL image and asset paths MUST be defined as static constants in the `AppAssets` class (`lib/core/constants/app_assets.dart`).
- Never use raw string paths for assets in the UI code (e.g., use `AppAssets.logo` instead of `'assets/images/logo.png'`).

## 3. Code Structure & Strict Size Limits
- **MAX 120 LINES RULE**: No single Dart file (especially UI screens) should exceed **120 lines of code**.
- **Componentization**: If a screen file is getting larger than 120 lines, you MUST extract its parts into smaller separate widget files. Place these extracted widgets inside a `widgets/` folder within that feature's directory.
- **Stateless Architecture**: Screens should always be `StatelessWidget` (or extend `GetView`). Do not use `StatefulWidget`. Handle all state logic and variables inside the respective GetX Controller.

## 4. Performance & Memory Management
- **Const & Final**: Heavily use `const` for widgets and constructors to optimize performance. Always use `final` for variables that do not change.
- **Resource Disposal**: Always properly close and dispose of `TextEditingController`, `FocusNode`, and other memory-heavy objects inside the `onClose()` method of the GetX Controller.
