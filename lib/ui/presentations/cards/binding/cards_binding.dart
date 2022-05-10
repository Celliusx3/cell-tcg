import 'package:celltcg/data/base/repositories/source/source_repository.dart';
import 'package:celltcg/ui/presentations/cards/controller/cards_controller.dart';
import 'package:get/get.dart';

class CardsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CardsController>(() {
      return CardsController(Get.find<SourceRepository>());
    });
  }
}