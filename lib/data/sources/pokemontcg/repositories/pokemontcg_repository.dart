import 'dart:convert';

import 'package:celltcg/data/base/models/requests/search_request.dart';
import 'package:celltcg/data/base/models/responses/tcg_card_details_response.dart';
import 'package:celltcg/data/base/models/responses/tcg_card_response.dart';
import 'package:celltcg/data/base/models/responses/tcg_set_response.dart';
import 'package:celltcg/data/base/repositories/source/source_repository.dart';
import 'package:celltcg/data/sources/pokemontcg/models/entities/pokemontcg_card.dart';
import 'package:celltcg/data/sources/pokemontcg/models/entities/pokemontcg_card_details.dart';
import 'package:celltcg/data/sources/pokemontcg/models/entities/pokemontcg_set.dart';
import 'package:celltcg/data/sources/pokemontcg/models/responses/pokemontcg_card_details_response.dart';
import 'package:celltcg/data/sources/pokemontcg/models/responses/pokemontcg_cards_response.dart';
import 'package:celltcg/data/sources/pokemontcg/models/responses/pokemontcg_sets_response.dart';
import 'package:get/get.dart';

class PokemonTCGRepository extends GetConnect implements SourceRepository {

  @override
  String getName() {
    return "Pokemon";
  }

  @override
  Future<List<TCGSetResponse>> getSets() async{
    const url = 'https://api.pokemontcg.io/v2/sets';
    final response = get(url).then((value) {
      final data = json.decode(value.bodyString ?? "");
      return PokemonTCGSetsResponse.fromJson(data).data;
    }).then((value) {
      return value.map((e) => PokemonTCGSet.fromResponse(e)).toList();
    });

    return response;
  }

  @override
  Future<List<TCGCardResponse>> getCards(String id) async{
    final map = {"q": "set.id:$id"};
    const url = 'https://api.pokemontcg.io/v2/cards';
    final response = get(url, query: map).then((value) {
      final data = json.decode(value.bodyString ?? "");
      return PokemonTCGCardsResponse.fromJson(data).data;
    }).then((value) {
      return value.map((e) => PokemonTCGCard.fromResponse(e)).toList();
    });

    return response;
  }

  @override
  Future<TCGCardDetailsResponse> getCardDetails(String id) async{
    final url = "https://api.pokemontcg.io/v2/cards/$id";

    final response = get(url).then((value) {
      final data = json.decode(value.bodyString ?? "");
      return PokemonTCGCardDetailsResponse.fromJson(data).data;
    }).then((value) {
      return PokemonTCGCardDetails.fromResponse(value);
    });

    return response;
  }

  @override
  Future<List<TCGCardResponse>> search(SearchRequest request) {
    const url = 'https://api.pokemontcg.io/v2/cards';
    final map = {
      "q": "name:${request.query}",
      "page": (request.page?? 1).toString()
    };
    final response = get(url, query: map).then((value) {
      final data = json.decode(value.bodyString ?? "");
      return PokemonTCGCardsResponse.fromJson(data).data;
    }).then((value) {
      return value.map((e) => PokemonTCGCard.fromResponse(e)).toList();
    });

    return response;
  }
}