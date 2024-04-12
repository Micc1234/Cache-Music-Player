import 'package:flutter/material.dart';

class Browser extends StatelessWidget {
  Browser({Key? key}) : super(key: key);

  List<String> categories = [
    "Music",
    "Podcasts",
    "Live Events",
    "Made For You",
    "New Releases",
    "Ramadan",
    "Pop",
    "Musik Indonesia",
    "Podcast Charts",
    "Podcast New Releases",
    "Video Podcasts",
    "Only On Spotify"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Browse all'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                // Implementasi aksi yang ingin dilakukan ketika item diklik
                print('Item ${categories[index]} clicked');
              },
              child: Center(
                child: Text(
                  categories[index],
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
