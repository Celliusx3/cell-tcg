import 'package:celltcg/data/base/models/responses/tcg_card_type_price_response.dart';
import 'package:celltcg/data/base/models/responses/tcg_title_value_response.dart';
import 'package:celltcg/data/sources/pokemontcg/models/entities/pokemontcg_title_value.dart';
import 'package:celltcg/data/utilities/string_utils.dart';
import 'package:recase/recase.dart';

class PokemonTCGCardTypePrice extends TCGCardTypePriceResponse {
  String? title;
  List<PokemonTCGTitleValue> prices;

  PokemonTCGCardTypePrice(
    this.title,
    this.prices
  );

  factory PokemonTCGCardTypePrice.from(String? title, String locale, Map<String, double> prices) {
    List<PokemonTCGTitleValue> res = [];
    prices.forEach((key, value) {
      res.add(PokemonTCGTitleValue(key.titleCase, StringUtils.toCurrencyText(locale, value)));
    });
    return PokemonTCGCardTypePrice(
      title,
      res
    );
  }

  @override
  String? getTitle() {
    return title;
  }

  @override
  List<TCGTitleValueResponse> getPrices() {
    return prices;
  }
}