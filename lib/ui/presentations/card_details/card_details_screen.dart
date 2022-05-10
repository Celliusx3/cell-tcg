import 'package:cached_network_image/cached_network_image.dart';
import 'package:celltcg/data/base/models/responses/tcg_card_details_response.dart';
import 'package:celltcg/ui/presentations/card_details/controller/card_details_controller.dart';
import 'package:celltcg/ui/widgets/tcg_card_price_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CardDetailsScreen extends GetView<CardDetailsController> {
  const CardDetailsScreen({Key? key}) : super(key: key);

  Widget _renderEmptyHeader() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: AspectRatio(
          aspectRatio: 146/204,
          child:  Container(
            color: Colors.black,
          ),
        )
      )
    );
  }

  Widget _renderEmptyTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Container(
          color: Colors.black,
          height: 16 * 5,
          width: double.infinity,
        ),
      ),
    );
  }

  Widget _renderEmptySection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Container(
          color: Colors.black,
          height: 16 * 10,
          width: double.infinity,
        ),
      ),
    );
  }

  Widget _renderLoading() {
    return Shimmer.fromColors(
        baseColor: Colors.grey[900]!,
        highlightColor: Colors.grey[800]!,
        enabled: true,
        child: ListView(
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              _renderEmptyHeader(),
              _renderEmptyTitle(),
              _renderEmptySection(),
            ]
        )
    );
  }

  Widget _renderHeader(TCGCardDetailsResponse data) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: AspectRatio(
          aspectRatio: 146/204,
          child: CachedNetworkImage(
            imageUrl: data.getImage(),
            fit: BoxFit.cover,
          ),
        )
      )
    );
  }

  Future<void> _refreshData() async {
    return controller.onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Obx(() {
          return controller.initialLoading ?
          _renderLoading():
          RefreshIndicator(
            onRefresh: _refreshData,
            child: Obx(() =>
              ListView(
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                children: [
                  _renderHeader(controller.data!),
                  TCGCardPriceWidget(controller.data!.getPrices()),
                  const SizedBox(height: 32.0)
                ]
              )
            ),
          );
        }),
      )
    );
  }
}