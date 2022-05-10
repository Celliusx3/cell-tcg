class PokemonTCGSetResponse {
  final String id;
  final String name;
  final String image;
  final String releaseDate;

  PokemonTCGSetResponse(
    this.id,
    this.name,
    this.image,
    this.releaseDate);

  factory PokemonTCGSetResponse.fromJson(Map data) {
    return PokemonTCGSetResponse(
      data['id'],
      data['name'],
      data['images']['logo'],
      data['releaseDate']
    );
  }
}