
class PokemonTCGCardCardMarketResponse {
  final String url;
  final String updatedAt;
  final Map<String, double> prices;

  PokemonTCGCardCardMarketResponse(
    this.url,
    this.updatedAt,
    this.prices
  );

  factory PokemonTCGCardCardMarketResponse.fromJson(Map data) {
    final prices = Map<String, double>.from(data['prices']);

    return PokemonTCGCardCardMarketResponse(
        data['url'],
        data['updatedAt'],
        prices
    );
  }
}