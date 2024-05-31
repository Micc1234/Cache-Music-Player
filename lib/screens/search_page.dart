import 'package:cache_music_player/widgets/browser.dart';
import 'package:flutter/material.dart';
import 'package:cache_music_player/widgets/search_bar.dart' as CustomSearchBar;

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            child: CustomSearchBar.SearchBar(),
            padding: EdgeInsets.all(20),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Browse All",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Expanded(child: Browser())
        ],
      ),
    );
  }
}
