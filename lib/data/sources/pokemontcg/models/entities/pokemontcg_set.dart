import 'package:celltcg/data/base/models/responses/tcg_set_response.dart';
import 'package:celltcg/data/sources/pokemontcg/models/responses/pokemontcg_set_response.dart';

class PokemonTCGSet extends TCGSetResponse {
  final String _id;
  final String _name;
  final String _releaseDate;
  final String _image;

  PokemonTCGSet(this._id,
    this._name,
    this._releaseDate,
    this._image);

  factory PokemonTCGSet.fromResponse(PokemonTCGSetResponse response) {
    return PokemonTCGSet(response.id, response.name, response.releaseDate, response.image);
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
  String getReleaseDate() {
    return _releaseDate;
  }

}