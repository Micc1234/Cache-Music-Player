import 'package:flutter/material.dart';
import 'package:cache_music_player/models/data_provider.dart';
import 'package:provider/provider.dart';
import 'package:cache_music_player/models/music_class_model.dart';
import 'package:cache_music_player/widgets/music_tile.dart';

class CategoryPage extends StatelessWidget {
  final String category;

  CategoryPage({required this.category});

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
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      "https://t3.ftcdn.net/jpg/06/35/25/68/360_F_635256827_KKLD6dXXWuHyGvRE8uic9QmVqpURX4H2.jpg",
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
                        category,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Enjoy listening!",
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
