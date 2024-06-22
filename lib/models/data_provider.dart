import 'dart:math';

import 'package:cache_music_player/models/hits_class_model.dart';
import 'package:cache_music_player/models/music_class_model.dart';
import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  final List<Hits> _hitsData = [
    Hits(
        name: "Taylor Swift Eras Tour",
        imgSrc:
            "https://www.rollingstone.com/wp-content/uploads/2023/08/taylor-swift-eras-moments.jpg?w=1581&h=1054&crop=1"),
    Hits(
        name: "KPOP Hits 2022",
        imgSrc:
            "https://c.saavncdn.com/editorial/KPopHits2022_20231205072029.jpg"),
    Hits(
        name: "Tops Hits",
        imgSrc:
            "https://i.scdn.co/image/ab67616d0000b273674ee85ea544f17b5726c54b"),
    Hits(
        name: "Tiktok Hits",
        imgSrc:
            "https://i1.sndcdn.com/artworks-6e9dSkKPEWWT8IPM-uW8Zyw-t500x500.jpg")
  ];

  final List<Music> _musicData = [
    Music(
        id: 1,
        name: "Monokrom",
        singer: "Tulus",
        imgSrc:
            "https://i.scdn.co/image/ab67616d0000b27371c65edbeed32af70b900637",
        favorite: false,
        lang: "Indonesian"),
    Music(
        id: 2,
        name: "Mine",
        singer: "Petra Sihombing",
        imgSrc:
            "https://pophariini.com/wp-content/uploads/2020/06/Petra-Profil-Manusia-Kasur.jpg",
        favorite: false,
        lang: "English"),
    Music(
        id: 3,
        name: "Reckless",
        singer: "Madison Beer",
        imgSrc:
            "https://assets.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/2022/01/19/1827821676.png",
        favorite: false,
        lang: "English"),
    Music(
        id: 4,
        name: "Photograph",
        singer: "Ed Sheeran",
        imgSrc:
            "https://i.scdn.co/image/ab67616d0000b273ee4c02e63b2b3452322184d7",
        favorite: false,
        lang: "English"),
    Music(
        id: 5,
        name: "Imagination",
        singer: "Shawn Mendes",
        imgSrc:
            "https://i.scdn.co/image/ab67616d00001e022d6a4125a1d62dc6185f74ea",
        favorite: false,
        lang: "English"),
    Music(
        id: 6,
        name: "Until I Found You",
        singer: "Stephen Sanchez",
        imgSrc:
            "https://imgx.sonora.id/crop/0x69:640x515/x/photo/2022/08/17/until-ijpg-20220817015235.jpg",
        favorite: false,
        lang: "English"),
    Music(
        id: 7,
        name: "Everything I Need",
        singer: "Skylar Grey",
        imgSrc:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQt8pIPnJ6BCwfKzPsA2bN0GKDmzpnXpDUsfBdlAZbYOA&s",
        favorite: false,
        lang: "English"),
    Music(
        id: 8,
        name: "Happy",
        singer: "skinnyfabs",
        imgSrc:
            "https://i1.sndcdn.com/artworks-000574130099-a7nis8-t500x500.jpg",
        favorite: false,
        lang: "English"),
    Music(
        id: 9,
        name: "Bertaut",
        singer: "Nadin Amizah",
        imgSrc:
            "https://i.scdn.co/image/ab67616d0000b2736d57a5c60decaa8fb39d5afb",
        favorite: false,
        lang: "Indonesian"),
    Music(
        id: 10,
        name: "Love Story",
        singer: "Taylor Swift",
        imgSrc:
            "https://americannoise.com/wp-content/uploads/2018/07/Taylor-Swift-Love-Story-1200x900.jpg",
        favorite: false,
        lang: "English"),
  ];

  List<Music> _filteredMusicList = [];
  DataProvider() {
    _filteredMusicList = _musicData;
  }

  List<Music> _favoriteData = [];

  List<Music> getMusicList() {
    return _filteredMusicList;
  }

  void filterMusic(String filterValue) {
    if (filterValue == 'All') {
      _filteredMusicList = _musicData;
    } else {
      _filteredMusicList =
          _musicData.where((music) => music.lang == filterValue).toList();
    }
    notifyListeners();
  }

  List<Music> getFavList() {
    return _favoriteData;
  }

  List<Hits> getHitsList() {
    return _hitsData;
  }

  Color colorFunc(Music music) {
    return (music.favorite) ? Colors.red : Colors.grey;
  }

  void addToFav(Music music) {
    _favoriteData.add(music);
    music.toggleFavorite();
    notifyListeners();
  }

  void removeFromFav(Music music) {
    _favoriteData.remove(music);
    music.toggleFavorite();
    notifyListeners();
  }

  Music getRandomMusic(Music currentMusic) {
    Random random = Random();
    Music randomMusic;

    do {
      randomMusic = _musicData[random.nextInt(_musicData.length)];
    } while (randomMusic == currentMusic);

    return randomMusic;
  }
}
