import 'package:flutter/material.dart';
import 'package:cache_music_player/models/music_class_model.dart';
import 'package:cache_music_player/screens/music_player_page.dart';

class MusicTile extends StatelessWidget {
  MusicTile({
    Key? key,
    required this.music,
    required this.colorFunc,
    required this.favButtonFunc,
    required this.musicList,
    required this.initialIndex,
    required this.enableFav,
  }) : super(key: key);

  final Music music;
  final Color colorFunc;
  final Function() favButtonFunc;
  final List<Music> musicList;
  final int initialIndex;
  final bool enableFav;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MusicPlayer(
                musicList: musicList,
                initialIndex: initialIndex,
              ),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Card(
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          music.imgSrc,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            music.name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            music.singer,
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      Spacer(),
                      if (enableFav)
                        IconButton(
                          icon: Icon(Icons.favorite),
                          color: colorFunc,
                          onPressed: favButtonFunc,
                        ),
                      if (!enableFav) // Tambahkan kondisi untuk tombol play jika enableFav adalah false
                        IconButton(
                          icon: Icon(Icons.play_arrow),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MusicPlayer(
                                  musicList: musicList,
                                  initialIndex: initialIndex,
                                ),
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
