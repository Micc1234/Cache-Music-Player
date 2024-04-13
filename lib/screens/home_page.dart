import 'package:cache_music_player/widgets/hits_list.dart';
import 'package:cache_music_player/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:cache_music_player/widgets/music_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          TitleText(titleText: "For You"),
          HitsList(),
          SizedBox(
            height: 30,
          ),
          TitleText(titleText: "Recommended"),
          MusicList(),
        ],
      ),
    ));
  }
}
