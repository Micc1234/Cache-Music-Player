import 'package:cache_music_player/screens/categories_page.dart';
import 'package:flutter/material.dart';

class Browser extends StatelessWidget {
  Browser({Key? key}) : super(key: key);

  List<String> categories = [
    "Music",
    "New Releases",
    "Pop",
    "Jazz",
    "Rock",
    "Hip-Hop",
    "Metal",
    "Classic"
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          margin: EdgeInsets.all(8),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CategoryPage(category: categories[index]),
                ),
              );
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
    );
  }
}
