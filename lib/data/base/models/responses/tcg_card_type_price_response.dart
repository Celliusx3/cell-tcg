import 'package:celltcg/data/base/models/responses/tcg_title_value_response.dart';

abstract class TCGCardTypePriceResponse{
  String? getTitle();
  List<TCGTitleValueResponse> getPrices();
}
