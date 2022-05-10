class PokemonTCGCardResponse {
  final String id;
  final String name;
  final String image;

  PokemonTCGCardResponse(
      this.id,
      this.name,
      this.image);

  factory PokemonTCGCardResponse.fromJson(Map data) {
    return PokemonTCGCardResponse(
        data['id'],
        data['name'],
        data['images']['small']
    );
  }
}