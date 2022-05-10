import 'package:celltcg/ui/presentations/settings/controller/settings_controller.dart';
import 'package:get/get.dart';

class SettingsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(() {
      return SettingsController();
    });
  }
}