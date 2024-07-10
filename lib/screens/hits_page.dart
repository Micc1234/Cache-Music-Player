import 'package:flutter/material.dart';
import 'package:cache_music_player/models/data_provider.dart';
import 'package:cache_music_player/models/hits_class_model.dart';
import 'package:cache_music_player/models/music_class_model.dart';
import 'package:provider/provider.dart';
import 'package:cache_music_player/widgets/music_tile.dart';

class HitsPage extends StatelessWidget {
  final Hits hits;

  HitsPage({Key? key, required this.hits}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataProvider dataProvider = Provider.of<DataProvider>(context);

    List<Music> randomMusicList = dataProvider.generateRandomMusicList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text(
          "Cache Music Player",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      hits.imgSrc,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hits.name,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Enjoy Listening",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: randomMusicList.length,
              itemBuilder: (context, index) {
                return MusicTile(
                  music: randomMusicList[index],
                  colorFunc: dataProvider.colorFunc(randomMusicList[index]),
                  favButtonFunc: () {},
                  musicList: randomMusicList,
                  initialIndex: index,
                  enableFav: false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
