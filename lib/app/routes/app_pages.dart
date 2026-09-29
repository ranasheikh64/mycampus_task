import 'package:get/get.dart';

import '../../features/assignment/assignment_home/bindings/assignment_home_binding.dart';
import '../../features/assignment/assignment_home/views/assignment_home_view.dart';
import '../../features/attendance/attendance_home/bindings/attendance_home_binding.dart';
import '../../features/attendance/attendance_home/views/attendance_home_view.dart';
import '../../features/auth/forget_password/bindings/forget_password_binding.dart';
import '../../features/auth/forget_password/views/forget_password_view.dart';
import '../../features/auth/login/bindings/login_binding.dart';
import '../../features/auth/login/views/login_view.dart';
import '../../features/auth/registration/bindings/registration_binding.dart';
import '../../features/auth/registration/views/registration_view.dart';
import '../../features/home/home_main/bindings/home_main_binding.dart';
import '../../features/home/home_main/views/home_main_view.dart';
import '../../features/main_bottom_navigationbar/bindings/main_bottom_navigationbar_binding.dart';
import '../../features/main_bottom_navigationbar/views/main_bottom_navigationbar_view.dart';
import '../../features/profile/profile_home/bindings/profile_home_binding.dart';
import '../../features/profile/profile_home/views/profile_home_view.dart';
import '../../features/routine/routine_home/bindings/routine_home_binding.dart';
import '../../features/routine/routine_home/views/routine_home_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRATION,
      page: () => const RegistrationView(),
      binding: RegistrationBinding(),
    ),
    GetPage(
      name: _Paths.FORGET_PASSWORD,
      page: () => const ForgetPasswordView(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_HOME,
      page: () => const ProfileHomeView(),
      binding: ProfileHomeBinding(),
    ),
    GetPage(
      name: _Paths.HOME_MAIN,
      page: () => const HomeMainView(),
      binding: HomeMainBinding(),
    ),
    GetPage(
      name: _Paths.ROUTINE_HOME,
      page: () => const RoutineHomeView(),
      binding: RoutineHomeBinding(),
    ),
    GetPage(
      name: _Paths.ATTENDANCE_HOME,
      page: () => const AttendanceHomeView(),
      binding: AttendanceHomeBinding(),
    ),
    GetPage(
      name: _Paths.ASSIGNMENT_HOME,
      page: () => const AssignmentHomeView(),
      binding: AssignmentHomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_BOTTOM_NAVIGATIONBAR,
      page: () => const MainBottomNavigationbarView(),
      binding: MainBottomNavigationbarBinding(),
    ),
  ];
}
