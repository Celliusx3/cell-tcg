import 'package:celltcg/data/base/repositories/source/source_repository.dart';
import 'package:celltcg/ui/presentations/card_details/controller/card_details_controller.dart';
import 'package:get/get.dart';

class CardDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CardDetailsController>(() {
      return CardDetailsController(Get.find<SourceRepository>());
    });
  }
}