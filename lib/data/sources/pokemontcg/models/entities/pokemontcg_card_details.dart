import 'package:celltcg/data/base/models/responses/tcg_card_details_response.dart';
import 'package:celltcg/data/base/models/responses/tcg_card_price_response.dart';
import 'package:celltcg/data/sources/pokemontcg/models/entities/pokemontcg_card_price.dart';
import 'package:celltcg/data/sources/pokemontcg/models/responses/pokemontcg_card_details_data_response.dart';

class PokemonTCGCardDetails extends TCGCardDetailsResponse {
  final String _id;
  final String _name;
  final String _image;
  final List<PokemonTCGCardPrice> _prices;

  PokemonTCGCardDetails(
    this._id,
    this._name,
    this._image,
    this._prices
  );

  factory PokemonTCGCardDetails.fromResponse(PokemonTCGCardDetailsDataResponse response) {
    return PokemonTCGCardDetails(
      response.id, 
      response.name, 
      response.image, 
      [
        PokemonTCGCardPrice.fromTCGPlayerResponse("TCGPlayer", response.tcgplayer),
        PokemonTCGCardPrice.fromCardMarketResponse("Cardmarket", response.cardmarket),
      ]
    );
  }

  @override
  String getId() {
    return _id;
  }

  @override
  String getImage() {
    return _image;
  }

  @override
  String getName() {
    return _name;
  }

  @override
  List<TCGCardPriceResponse> getPrices() {
    return _prices;
  }
}