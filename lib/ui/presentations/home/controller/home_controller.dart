import 'package:celltcg/data/base/models/responses/tcg_set_response.dart';
import 'package:celltcg/data/base/repositories/source/source_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final SourceRepository _repository;

  final _data = <TCGSetResponse>[].obs;
  final _initialLoading = false.obs;

  List<TCGSetResponse> get data => _data.toList();
  String get title => _repository.getName();
  bool get initialLoading => _initialLoading.value;

  HomeController(this._repository);

  @override
  void onInit() {
    super.onInit();
    _onGetHome(true);
  }

  Future<void> onRefresh() async {
    return _onGetHome(false);
  }

  Future<void> _onGetHome(bool isInitialLoading) async {
    if(isInitialLoading) _initialLoading.value = true;
    return _repository.getSets().then((value) {
      _data.value = value;
      if(isInitialLoading) _initialLoading.value = false;
    });
  }
}