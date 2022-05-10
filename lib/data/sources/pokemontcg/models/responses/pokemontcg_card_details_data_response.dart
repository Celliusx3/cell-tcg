import 'package:celltcg/data/sources/pokemontcg/models/responses/pokemontcg_card_cardmarket_response.dart';
import 'package:celltcg/data/sources/pokemontcg/models/responses/pokemontcg_card_tcgplayer_response.dart';

class PokemonTCGCardDetailsDataResponse {
  final String id;
  final String name;
  final String image;
  final PokemonTCGCardTCGPlayerResponse tcgplayer;
  final PokemonTCGCardCardMarketResponse cardmarket;

  PokemonTCGCardDetailsDataResponse(
    this.id,
    this.name,
    this.image,
    this.tcgplayer,
    this.cardmarket
  );

  factory PokemonTCGCardDetailsDataResponse.fromJson(Map data) {
    return PokemonTCGCardDetailsDataResponse(
      data['id'],
      data['name'],
      data['images']['large'],
      PokemonTCGCardTCGPlayerResponse.fromJson(data['tcgplayer']),
      PokemonTCGCardCardMarketResponse.fromJson(data['cardmarket'])
    );
  }
}