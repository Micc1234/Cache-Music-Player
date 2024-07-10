import 'dart:math';
import 'package:cache_music_player/models/hits_class_model.dart';
import 'package:cache_music_player/models/music_class_model.dart';
import 'package:flutter/material.dart';
import 'package:cache_music_player/models/user_class_model.dart';

class DataProvider extends ChangeNotifier {
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
    Music(
      id: 11,
      name: "Surat Cinta Untuk Starla",
      singer: "Virgoun",
      imgSrc:
          "https://awsimages.detik.net.id/community/media/visual/2016/03/01/1c7c83f2-05d7-43a5-852c-7897f88a2731.jpg?w=600&q=90",
      favorite: false,
      lang: "Indonesian",
    ),
    Music(
      id: 12,
      name: "Dari Planet Lain",
      singer: "Sal Priadi",
      imgSrc:
          "https://asset-a.grid.id/crop/0x0:0x0/x/photo/2024/04/18/fotojet-14jpg-20240418015616.jpg",
      favorite: false,
      lang: "Indonesian",
    ),
    Music(
      id: 13,
      name: "Satu Satu",
      singer: "Igditaf",
      imgSrc:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvEUoR5u50lUYZqWHQ0tq76Bf_9zGNs07nIQ&s",
      favorite: false,
      lang: "Indonesian",
    ),
    Music(
      id: 14,
      name: "Dia",
      singer: "Anji",
      imgSrc: "https://i1.sndcdn.com/artworks-000206427888-t488kr-t500x500.jpg",
      favorite: false,
      lang: "Indonesian",
    ),
    Music(
      id: 15,
      name: "Melukis Senja",
      singer: "Budi Doremi",
      imgSrc:
          "https://i.scdn.co/image/ab67616d0000b27337f883f98514a0852046e2f0",
      favorite: false,
      lang: "Indonesian",
    ),
    Music(
      id: 16,
      name: "Penjaga Hati",
      singer: "Nadhif Basalamah",
      imgSrc:
          "https://i1.sndcdn.com/artworks-Qv2tMzibfMdiA8sv-Us3jhQ-t500x500.jpg",
      favorite: false,
      lang: "Indonesian",
    ),
  ];

  final List<Hits> _hitsData = [
    Hits(
        name: "Study playlist",
        imgSrc:
            "https://i1.sndcdn.com/artworks-m5GmzxRYjSNAcqsi-XVbAiA-t500x500.jpg"),
    Hits(
        name: "What's trending",
        imgSrc:
            "https://qph.cf2.quoracdn.net/main-qimg-90f960560ccde6b8f4beeb7dbcfb5bbe-pjlq"),
    Hits(
        name: "Tops Hits",
        imgSrc:
            "https://i.scdn.co/image/ab67616d0000b273674ee85ea544f17b5726c54b"),
    Hits(
        name: "Tiktok Hits",
        imgSrc:
            "https://i1.sndcdn.com/artworks-6e9dSkKPEWWT8IPM-uW8Zyw-t500x500.jpg")
  ];

  List<Music> _filteredMusicList = [];
  DataProvider() {
    _filteredMusicList = _musicData;
  }
  List<Music> getMusicList() {
    return _filteredMusicList;
  }

  List<Music> _favoriteData = [];

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

  Music fabRandomMusic() {
    Random random = Random();
    Music randomMusic;
    randomMusic = _musicData[random.nextInt(_musicData.length)];
    return randomMusic;
  }

  Music getRandomMusic(Music currentMusic) {
    Random random = Random();
    Music randomMusic;

    do {
      randomMusic = _musicData[random.nextInt(_musicData.length)];
    } while (randomMusic == currentMusic);

    return randomMusic;
  }

  List<Music> generateRandomMusicList() {
    List<Music> randomMusicList = [];

    Random random = Random();
    int index = 0;

    while (index < 7) {
      Music randomMusic = _musicData[random.nextInt(_musicData.length)];
      if (!randomMusicList.contains(randomMusic)) {
        randomMusicList.add(randomMusic);
        index++;
      }
    }

    return randomMusicList;
  }

  final List<User> users = [
    User(username: "user1", email: "user1@gmail.com", password: "pwd1"),
    User(username: "user2", email: "user2@gmail.com", password: "pwd2"),
  ];

  User? _loggedInUser;

  User? getLoggedInUser() {
    return _loggedInUser;
  }

  bool loginAction(String email, String password) {
    for (User user in users) {
      if (user.email == email && user.password == password) {
        _loggedInUser = user;
        return true;
      }
    }
    return false;
  }

  void addUser(String username, String email, String password) {
    User newUser = User(username: username, email: email, password: password);
    users.add(newUser);
    notifyListeners();
  }
}
