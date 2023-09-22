import 'package:get/get.dart';
import 'package:menu_ar/viewModel/auth_view_model.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel(), fenix: true);
  }
}