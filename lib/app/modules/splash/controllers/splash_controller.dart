import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _handleLogin();
  }

  void _handleLogin() async {
    // Simulated delay for synchronizing data
    await Future.delayed(const Duration(seconds: 3));
    
    // Replace with your actual auth checking logic here
    Get.offAllNamed(Routes.LOGIN);
  }
}
