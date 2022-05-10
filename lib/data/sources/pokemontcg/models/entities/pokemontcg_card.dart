import 'package:celltcg/data/base/models/responses/tcg_card_response.dart';
import 'package:celltcg/data/sources/pokemontcg/models/responses/pokemontcg_card_response.dart';

class PokemonTCGCard extends TCGCardResponse {
  final String _id;
  final String _name;
  final String _image;

  PokemonTCGCard(this._id,
    this._name,
    this._image);

  factory PokemonTCGCard.fromResponse(PokemonTCGCardResponse response) {
    return PokemonTCGCard(response.id, response.name, response.image);
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
}