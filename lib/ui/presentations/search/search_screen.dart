import 'package:celltcg/data/base/models/responses/tcg_card_response.dart';
import 'package:celltcg/ui/presentations/search/controller/search_controller.dart';
import 'package:celltcg/ui/routes/app_routes.dart';
import 'package:celltcg/ui/widgets/tcg_card_loading_widget.dart';
import 'package:celltcg/ui/widgets/tcg_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class SearchScreen extends GetView<SearchController> {
  const SearchScreen({Key? key}) : super(key: key);

  Widget _renderImage(TCGCardResponse data) {
    return TCGCardWidget(
      data,
      onTap: () {
        Get.toNamed(Routes.CARD_DETAILS, arguments: {'id': data.getId() });
      },
    );
  }

  Widget _renderLoading() {
    return Shimmer.fromColors(
        baseColor: Colors.grey[900]!,
        highlightColor: Colors.grey[800]!,
        enabled: true,
        child:GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1/1.4,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
          ),
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          padding: const EdgeInsets.all(8.0),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Container(
                color: Colors.black,
              ),
            );
          },
        )
    );
  }

  Future<void> _refreshData() async {
    return controller.onRefresh();
  }

  @override Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onSubmitted: (value) { controller.onSubmitQuery(); },
                controller: controller.textController,
                decoration: const InputDecoration(
                  labelText: "Search",
                  prefixIcon: Icon(Icons.search_rounded),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))
                  )
                ),
              ),
            ),
            Expanded(
              child: Obx(() {
                return controller.initialLoading ?
                _renderLoading():
                RefreshIndicator(
                  onRefresh: _refreshData,
                  child: Obx(() => GridView.builder(
                    controller: controller.scrollController,
                    physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1/1.4,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                    ),
                    padding: const EdgeInsets.all(8.0),
                    itemCount: controller.data.length + ((!controller.lastPage) ? 2: 0),
                    itemBuilder: (BuildContext context, int index) {
                      if (index < controller.data.length) {
                        return _renderImage(controller.data[index]);
                      } else {
                        return const TCGCardLoadingWidget();
                      }
                    },
                  )),
                );
              }),
            )
          ],
        )
    );
  }
}