import 'package:celltcg/data/base/models/requests/search_request.dart';
import 'package:celltcg/data/base/models/responses/tcg_card_response.dart';
import 'package:celltcg/data/base/repositories/source/source_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  final SourceRepository _repository;

  var scrollController = ScrollController();
  var textController = TextEditingController();
  final _data = <TCGCardResponse>[].obs;
  final _lastPage = true.obs;
  final _paginationLoading = false.obs;
  final _initialLoading = false.obs;
  var _nextPage= 1;

  List<TCGCardResponse> get data => _data.toList();
  String get title => _repository.getName();
  bool get lastPage => _lastPage.value;
  bool get initialLoading => _initialLoading.value;

  SearchController(this._repository);

  @override
  void onInit() {
    super.onInit();
    _onAddScrollControllerListener();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }

  // For Pagination
  void _onAddScrollControllerListener() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 120) >=
          scrollController.position.maxScrollExtent) {
        if (_paginationLoading.isFalse && !lastPage) {
          _onGetSearch(false);
        }
      }
    });
  }

  Future<void> onSubmitQuery() async {
    _nextPage = 1;
    _lastPage.value = false;
    return _onGetSearch(true);
  }

  Future<void> onRefresh() async {
    _nextPage = 1;
    _lastPage.value = false;
    return _onGetSearch(false);
  }

  Future<void> _onGetSearch(bool isInitialLoading) async {
    if(isInitialLoading) {
      _initialLoading.value = true;
    }
    _paginationLoading.value = true;

    return _repository.search(SearchRequest(query: textController.text, page: _nextPage)).then((value) {
      if (value.isEmpty) {
        _lastPage.value = true;
      } else {
        _addData(_nextPage<= 1, value);
        _nextPage += 1;
      }
      _paginationLoading.value = false;
      if(isInitialLoading) _initialLoading.value = false;
    }).catchError((onError) {
    });
  }

  void _addData(bool shouldRefresh, List<TCGCardResponse> response) {
    final list = shouldRefresh ? <TCGCardResponse>[] : data;
    list.addAll(response);
    _data.value = list;
  }
}