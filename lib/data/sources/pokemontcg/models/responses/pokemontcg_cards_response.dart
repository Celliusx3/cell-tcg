import 'package:celltcg/data/sources/pokemontcg/models/responses/pokemontcg_card_response.dart';

class PokemonTCGCardsResponse {
  final List<PokemonTCGCardResponse> data;

  PokemonTCGCardsResponse(this.data);

  factory PokemonTCGCardsResponse.fromJson(Map data) {
    final list = (data['data'] as List).map((i) => PokemonTCGCardResponse.fromJson(i)).toList();
    return PokemonTCGCardsResponse(list);
  }
}