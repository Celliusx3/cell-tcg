import 'package:celltcg/data/base/repositories/source/source_repository.dart';
import 'package:celltcg/ui/presentations/search/controller/search_controller.dart';
import 'package:get/get.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(() {
      return SearchController(Get.find<SourceRepository>());
    });
  }
}