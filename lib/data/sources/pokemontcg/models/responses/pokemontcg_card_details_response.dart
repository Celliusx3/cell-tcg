import 'package:celltcg/data/sources/pokemontcg/models/responses/pokemontcg_card_details_data_response.dart';

class PokemonTCGCardDetailsResponse {
  PokemonTCGCardDetailsDataResponse data;

  PokemonTCGCardDetailsResponse(this.data);

  factory PokemonTCGCardDetailsResponse.fromJson(Map data) {
    return PokemonTCGCardDetailsResponse(PokemonTCGCardDetailsDataResponse.fromJson(data['data']));
  }
}