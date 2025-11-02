class AnimeModel {
  final int id;
  final String title;
  final String airing;
  final String imgUrl;
  final String synopsis;
  final List<String> genres;
  final String rating;
  final List<String> demographics;

  const AnimeModel({
    required this.id,
    required this.title,
    required this.genres,
    required this.synopsis,
    required this.airing,
    required this.imgUrl,
    required this.demographics,
    required this.rating,
  });
  @override
  String toString() {
    return "{$title, $id, ${genres.toString()}, }";
  }

  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    //Mapping an array in Dart is disgusting
    List<String> genres = (json["genres"] as List<dynamic>)
        .map((element) => element["name"] as String)
        .toList();

    //Manually building the array is much better
    List<String> demographics = [];
    for (int i = 0; i < json["demographics"].length; i++) {
      demographics.add(json["demographics"][i]["name"]);
    }
    return AnimeModel(
      title: json["title"],
      genres: genres,
      synopsis: json["synopsis"],
      airing: json["aired"]["string"],
      imgUrl: json["images"]["webp"]["large_image_url"],
      demographics: demographics,
      id: json["mal_id"],
      rating: json["rating"],
    );
  }
}
