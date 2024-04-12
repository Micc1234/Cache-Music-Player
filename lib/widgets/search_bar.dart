import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
      ),
      child: TextField(
        controller: _searchController,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'What do you want to listen to?',
          hintStyle: TextStyle(color: Colors.white),
          suffixIcon: IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Perform search action here, using _searchController.text
              print('Search: ${_searchController.text}');
            },
          ),
        ),
      ),
    );
  }
}
