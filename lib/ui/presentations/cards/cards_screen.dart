import 'package:celltcg/data/base/models/responses/tcg_card_response.dart';
import 'package:celltcg/ui/presentations/cards/controller/cards_controller.dart';
import 'package:celltcg/ui/routes/app_routes.dart';
import 'package:celltcg/ui/widgets/tcg_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CardsScreen extends GetView<CardsController> {
  const CardsScreen({Key? key}) : super(key: key);

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
      appBar: AppBar(
        title: Text(controller.title),
      ),
      body: SafeArea(
        child: Obx(() {
          return controller.initialLoading ?
          _renderLoading():
          RefreshIndicator(
            onRefresh: _refreshData,
            child: Obx(() => GridView.builder(
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1/1.4,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
              padding: const EdgeInsets.all(8.0),
              itemCount: controller.data.length,
              itemBuilder: (BuildContext context, int index) {
                return _renderImage(controller.data[index]);
              },
            )),
          );
        }),
      )
    );
  }
}