class Music {
  String name;
  String singer;
  String imgSrc;
  bool favorite;

  Music(
      {required this.name,
      required this.singer,
      required this.imgSrc,
      required this.favorite});

  void toggleFavorite() {
    favorite = !favorite;
  }
}
