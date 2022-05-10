import 'package:celltcg/data/base/repositories/source/source_repository.dart';
import 'package:celltcg/ui/presentations/home/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() {
      return HomeController(Get.find<SourceRepository>());
    });
  }
}