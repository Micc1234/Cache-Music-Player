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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/profile_pic.jpg'), // Add your profile picture asset
                  ),
                  SizedBox(height: 10),
                  Text(
                    'John Doe', // Your user's name
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'View profile', // Your user's email
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.bolt),
              title: Text("What's new"),
              onTap: () {
                // Add navigation here if needed
              },
            ),
            ListTile(
              leading: Icon(Icons.trending_up),
              title: Text('Your Sound Capsule'),
              onTap: () {
                // Add navigation here if needed
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Listening history'),
              onTap: () {
                // Add navigation here if needed
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('setting and privacy'),
              onTap: () {
                // Add navigation here if needed
              },
            ),
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0), // Set preferred height of AppBar
        child: AppBar(
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
          leading: Builder(
            builder: (context) => GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/profile_pic.jpg'), // Add your profile picture asset
                ),
              ),
            ),
          ),
        ),
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
        ],
      ),
    );
  }
}
