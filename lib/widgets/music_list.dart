import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cache_music_player/models/data_provider.dart';
import 'package:cache_music_player/widgets/music_tile.dart';

class MusicList extends StatelessWidget {
  const MusicList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
        builder: ((context, value, child) => SingleChildScrollView(
              child: Column(
                children: value.getMusicList().map((music) {
                  return MusicTile(
                    music: music,
                    favButtonFunc: () {
                      if (!music.favorite) {
                        context.read<DataProvider>().addToFav(music);
                      } else {
                        context.read<DataProvider>().removeFromFav(music);
                      }
                    },
                    colorFunc: context.read<DataProvider>().colorFunc(music),
                  );
                }).toList(),
              ),
            )));
  }
}
