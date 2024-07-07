import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cache_music_player/models/music_class_model.dart';
import 'package:cache_music_player/widgets/music_tile.dart';
import 'package:cache_music_player/models/data_provider.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({Key? key});

  @override
  Widget build(BuildContext context) {
    final List<Music> favoriteList = context.watch<DataProvider>().getFavList();

    return favoriteList.isEmpty
        ? Center(
            child: Text(
              "Nothing",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : Column(
            children: favoriteList.map((music) {
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
                musicList: favoriteList,
                initialIndex: favoriteList.indexOf(music),
                enableFav: true,
              );
            }).toList(),
          );
  }
}
