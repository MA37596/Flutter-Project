import 'package:animelist/models/anime_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimeCard extends StatelessWidget {
  final AnimeModel data;
  const AnimeCard({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(8),
      child: Text("Anime: ${data.title}"),
    );
  }
}
