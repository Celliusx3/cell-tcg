import 'package:celltcg/data/sources/pokemontcg/models/entities/pokemontcg_set.dart';
import 'package:celltcg/data/sources/pokemontcg/models/responses/pokemontcg_set_response.dart';

class PokemonTCGSetsResponse {
  final List<PokemonTCGSetResponse> data;

  PokemonTCGSetsResponse(this.data);

  factory PokemonTCGSetsResponse.fromJson(Map data) {
    final list = (data['data'] as List).map((i) => PokemonTCGSetResponse.fromJson(i)).toList();
    return PokemonTCGSetsResponse(list);
  }
}