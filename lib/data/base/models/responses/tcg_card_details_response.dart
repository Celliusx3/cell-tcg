import 'package:celltcg/data/base/models/responses/tcg_card_price_response.dart';

abstract class TCGCardDetailsResponse{
  String getId();
  String getName();
  String getImage();
  List<TCGCardPriceResponse> getPrices();
}
