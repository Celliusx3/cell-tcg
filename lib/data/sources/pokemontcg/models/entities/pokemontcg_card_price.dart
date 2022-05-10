import 'package:celltcg/data/base/models/responses/tcg_card_price_response.dart';
import 'package:celltcg/data/base/models/responses/tcg_card_type_price_response.dart';
import 'package:celltcg/data/sources/pokemontcg/models/entities/pokemontcg_card_type_price.dart';
import 'package:celltcg/data/sources/pokemontcg/models/responses/pokemontcg_card_cardmarket_response.dart';
import 'package:celltcg/data/sources/pokemontcg/models/responses/pokemontcg_card_tcgplayer_response.dart';
import 'package:recase/recase.dart';

class PokemonTCGCardPrice extends TCGCardPriceResponse {
  final String _name;
  final String _url;
  final String _updatedAt;
  final List<PokemonTCGCardTypePrice> _prices;

  PokemonTCGCardPrice(
    this._name,
    this._url,
    this._updatedAt,
    this._prices
  );

  factory PokemonTCGCardPrice.fromTCGPlayerResponse(String title, PokemonTCGCardTCGPlayerResponse response) {
    List<PokemonTCGCardTypePrice> prices = [];
    response.prices.forEach((key, value) {
      prices.add(PokemonTCGCardTypePrice.from(key.titleCase, "en-US", value));
    });
    return PokemonTCGCardPrice(
      title, 
      response.url, 
      response.updatedAt,
      prices
    );
  }

  factory PokemonTCGCardPrice.fromCardMarketResponse(String title, PokemonTCGCardCardMarketResponse response) {
    List<PokemonTCGCardTypePrice> prices = [];
    prices.add(PokemonTCGCardTypePrice.from(null, "de-DE", response.prices));
    return PokemonTCGCardPrice(
        title,
        response.url,
        response.updatedAt,
        prices
    );
  }

  @override
  String getName() {
    return _name;
  }

  @override
  List<TCGCardTypePriceResponse> getPrices() {
    return _prices;
  }

  @override
  String getUpdatedAt() {
    return _updatedAt;
  }

  @override
  String getUrl() {
    return _url;
  }
}