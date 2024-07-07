import 'package:cache_music_player/widgets/filter_music.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cache_music_player/models/data_provider.dart';
import 'package:cache_music_player/models/music_class_model.dart';
import 'package:cache_music_player/widgets/music_tile.dart';

class MusicList extends StatelessWidget {
  const MusicList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, value, child) {
        List<Music> musicList = value.getMusicList();

        return SingleChildScrollView(
          child: Column(
            children: [
              FilterMusic(),
              ...musicList.map((music) {
                int initialIndex = musicList.indexOf(music);
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
                  musicList: musicList,
                  initialIndex: initialIndex,
                  enableFav: true,
                );
              }).toList(),
            ],
          ),
        );
      },
    );
  }
}
