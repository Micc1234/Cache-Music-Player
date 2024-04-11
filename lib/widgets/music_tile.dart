import 'package:flutter/material.dart';
import 'package:cache_music_player/models/music_class_model.dart';

class MusicTile extends StatelessWidget {
  MusicTile(
      {super.key,
      required this.music,
      required this.colorFunc,
      required this.favButtonFunc});

  Music music;
  Color colorFunc;
  Function() favButtonFunc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
      child: Container(
        padding: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
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
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          music.name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          music.singer,
                          style: TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.favorite),
              color: colorFunc,
              onPressed: favButtonFunc,
            )
          ],
        ),
      ),
    );
  }
}
