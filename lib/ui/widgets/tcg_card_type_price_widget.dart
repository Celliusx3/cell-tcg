import 'package:celltcg/data/base/models/responses/tcg_card_type_price_response.dart';
import 'package:celltcg/ui/widgets/tcg_grid_widget.dart';
import 'package:flutter/material.dart';

class TCGCardTypePriceWidget extends StatelessWidget {
  final TCGCardTypePriceResponse _data;

  const TCGCardTypePriceWidget (TCGCardTypePriceResponse data, {Key? key}) :
        _data = data,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_data.getTitle() != null)
          ...[
            Text(
              _data.getTitle() ?? "",
              style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 4.0)
          ],
        TCGGridWidget(_data.getPrices())
      ],
    );
  }
}