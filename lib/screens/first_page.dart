import 'package:cache_music_player/screens/login_page.dart';
import 'package:cache_music_player/screens/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:cache_music_player/screens/home_page.dart';
import 'package:cache_music_player/screens/search_page.dart';
import 'package:cache_music_player/screens/favorite_page.dart';

class FirstPage extends StatefulWidget {
  FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int selectedIndex = 0;

  void navigate(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List pages = [
    HomePage(),
    SearchPage(),
    FavoritePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        },
        child: Icon(Icons.logout),
      ),
      appBar: AppBar(
        leading: IconButton(
          iconSize: 35,
          color: Colors.white,
          icon: Icon(Icons.list_rounded),
          onPressed: () {},
        ),
        backgroundColor: Colors.purple,
        title: Text(
          "Cache Music Player",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NotificationPage()));
            },
            icon: Icon(
              Icons.notifications,
            ),
            iconSize: 35,
            color: Colors.white,
          )
        ],
        centerTitle: true,
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: navigate,
          fixedColor: Colors.purple,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favorite"),
          ]),
    );
  }
}
