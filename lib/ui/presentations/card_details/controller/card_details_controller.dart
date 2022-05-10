import 'package:celltcg/data/base/models/responses/tcg_card_details_response.dart';
import 'package:celltcg/data/base/repositories/source/source_repository.dart';
import 'package:get/get.dart';

class CardDetailsController extends GetxController {
  final _id = Get.arguments['id'] ?? '';

  final SourceRepository _repository;
  final _data = Rxn<TCGCardDetailsResponse>();
  TCGCardDetailsResponse? get data => _data.value;

  final _initialLoading = false.obs;
  bool get initialLoading => _initialLoading.value;

  CardDetailsController(this._repository);

  @override
  void onInit() {
    super.onInit();
    _onGetVideoDetails(true);
  }

  Future<void> onRefresh() async {
    return _onGetVideoDetails(false);
  }

  Future<void> _onGetVideoDetails(bool isInitialLoading) async {
    if(isInitialLoading) _initialLoading.value = true;

    return _repository.getCardDetails(_id).then((value) {
      _data.value = value;
      if(isInitialLoading) _initialLoading.value = false;
    });
  }
}