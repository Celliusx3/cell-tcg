
class PokemonTCGCardTCGPlayerResponse {
  final String url;
  final String updatedAt;
  final Map<String, Map<String, double>> prices;

  PokemonTCGCardTCGPlayerResponse(
    this.url,
    this.updatedAt,
    this.prices
  );

  factory PokemonTCGCardTCGPlayerResponse.fromJson(Map data) {
    final prices = Map<String, Map>.from(data['prices'])
        .map((key, value) => MapEntry(key, Map<String, double>.from(value)));

    return PokemonTCGCardTCGPlayerResponse(
        data['url'],
        data['updatedAt'],
        prices
    );
  }
}