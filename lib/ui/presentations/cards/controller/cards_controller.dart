import 'package:celltcg/data/base/models/responses/tcg_card_response.dart';
import 'package:celltcg/data/base/repositories/source/source_repository.dart';
import 'package:get/get.dart';

class CardsController extends GetxController {
  final SourceRepository _repository;
  final _id = Get.arguments['id'] ?? '';
  final _title = Get.arguments['title']?? '';

  final _data = <TCGCardResponse>[].obs;
  final _initialLoading = false.obs;

  List<TCGCardResponse> get data => _data.toList();
  String get title => _title;
  bool get initialLoading => _initialLoading.value;

  CardsController(this._repository);

  @override
  void onInit() {
    super.onInit();
    _onGetData(true);
  }

  Future<void> onRefresh() async {
    return _onGetData(false);
  }

  Future<void> _onGetData(bool isInitialLoading) async {
    if(isInitialLoading) _initialLoading.value = true;
    return _repository.getCards(_id).then((value) {
      _data.value = value;
      if(isInitialLoading) _initialLoading.value = false;
    }).catchError((onError) {
    });
  }
}