import 'package:celltcg/data/base/models/responses/tcg_card_price_response.dart';
import 'package:celltcg/data/base/models/responses/tcg_card_type_price_response.dart';
import 'package:celltcg/ui/widgets/tcg_card_type_price_widget.dart';
import 'package:flutter/material.dart';

class TCGCardPriceWidget extends StatelessWidget {
  final List<TCGCardPriceResponse> _data;

  const TCGCardPriceWidget (List<TCGCardPriceResponse> data, {Key? key}) :
        _data = data,
        super(key: key);

  Widget _renderCardPriceSection(List<TCGCardTypePriceResponse> list) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 8.0);
      },
      itemBuilder: (BuildContext context, int index) {
        final price = list[index];
        return TCGCardTypePriceWidget(price);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 16.0);
      },
      itemCount: _data.length,
      itemBuilder: (BuildContext context, int index) {
        final price = _data[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              price.getName(),
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 8.0),
            _renderCardPriceSection(price.getPrices())
          ],
        );
      },
    );
  }
}