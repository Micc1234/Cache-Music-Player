class Music {
  int id;
  String name;
  String singer;
  String imgSrc;
  bool favorite;
  String lang;

  Music(
      {required this.id,
      required this.name,
      required this.singer,
      required this.imgSrc,
      required this.favorite,
      required this.lang});

  void toggleFavorite() {
    favorite = !favorite;
  }
}
