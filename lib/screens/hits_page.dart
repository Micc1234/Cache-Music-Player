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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Image.network(
                    hits.imgSrc,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 12),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(hits.imgSrc),
                          ),
                          SizedBox(width: 16),
                          Text(
                            hits.name,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
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
