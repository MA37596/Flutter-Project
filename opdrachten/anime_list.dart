import 'anime_card.dart';
import 'models/anime_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AnimeList extends StatefulWidget {
  const AnimeList({super.key});
  @override
  State<AnimeList> createState() => _AnimeListState();
}

class _AnimeListState extends State<AnimeList> {
  Future<List<dynamic>> fetchAnime() async {
    Uri url = Uri.parse("https://api.jikan.moe/v4/top/anime?type=tv&sfw=true");
    final response = await http.read(url);
    Map<String, dynamic> jsonData = jsonDecode(response);
    return jsonData["data"] as List<dynamic>;
  }

  List<AnimeCard> buildAnimeCardsList(List<dynamic> json) {
    List<AnimeCard> animes = [];
    for (var animeData in json) {
      animes.add(AnimeCard(data: AnimeModel.fromJson(animeData)));
    }
    return animes;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: fetchAnime(),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          List<AnimeCard> animes = buildAnimeCardsList(snapshot.data!);
          return ListView(padding: EdgeInsets.all(16), children: animes);
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
