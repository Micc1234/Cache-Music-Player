import 'dart:ffi';

import 'package:cache_music_player/widgets/browser.dart';
import 'package:flutter/material.dart';
import 'package:cache_music_player/widgets/search_bar.dart' as CustomSearchBar;

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          CustomSearchBar.SearchBar(),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Browse All",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(child: Browser())
        ],
      ),
    );
  }
}
