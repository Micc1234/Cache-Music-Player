import 'package:cache_music_player/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:cache_music_player/widgets/favorite_list.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          TitleText(titleText: "Favorite"),
          FavoriteList(),
        ],
      ),
    ));
  }
}
