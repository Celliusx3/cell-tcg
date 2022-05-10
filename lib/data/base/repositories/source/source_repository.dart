import 'package:celltcg/data/base/models/requests/search_request.dart';
import 'package:celltcg/data/base/models/responses/tcg_card_details_response.dart';
import 'package:celltcg/data/base/models/responses/tcg_card_response.dart';
import 'package:celltcg/data/base/models/responses/tcg_set_response.dart';

abstract class SourceRepository{
  Future<List<TCGSetResponse>> getSets();
  Future<List<TCGCardResponse>> getCards(String id);
  Future<List<TCGCardResponse>> search(SearchRequest request);
  Future<TCGCardDetailsResponse> getCardDetails(String id);

  String getName();
}