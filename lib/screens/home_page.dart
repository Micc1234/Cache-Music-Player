import 'package:cache_music_player/widgets/hits_list.dart';
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
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Row(
              children: [
                Text(
                  "For You",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          HitsList(),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Row(
              children: [
                Text(
                  "Recommended",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          MusicList(),
        ],
      ),
    ));
  }
}
