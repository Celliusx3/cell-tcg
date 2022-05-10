import 'package:celltcg/data/base/models/responses/tcg_card_type_price_response.dart';

abstract class TCGCardPriceResponse{
  String getName();
  String getUrl();
  String getUpdatedAt();
  List<TCGCardTypePriceResponse> getPrices();
}
