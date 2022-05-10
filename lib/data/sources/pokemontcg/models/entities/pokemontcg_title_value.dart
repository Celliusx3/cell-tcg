import 'package:celltcg/data/base/models/responses/tcg_title_value_response.dart';

class PokemonTCGTitleValue extends TCGTitleValueResponse {
  String title;
  String value;

  PokemonTCGTitleValue(
    this.title,
    this.value
  );

  @override
  String getTitle() {
    return title;
  }

  @override
  String getValue() {
    return value;
  }
}