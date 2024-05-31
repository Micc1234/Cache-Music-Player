import 'package:cache_music_player/screens/login_page.dart';
import 'package:cache_music_player/screens/notification_page.dart';
import 'package:cache_music_player/widgets/rating_dialog.dart';
import 'package:cache_music_player/widgets/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:cache_music_player/screens/home_page.dart';
import 'package:cache_music_player/screens/search_page.dart';
import 'package:cache_music_player/screens/favorite_page.dart';
import 'package:provider/provider.dart';

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
          showDialog(
            context: context,
            builder: (context) => RatingDialog(),
          );
        },
        child: Icon(Icons.star),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.account_circle_rounded),
                        radius: 30,
                        // backgroundImage: AssetImage('assets/profile_pic.jpg'),
                      ),
                      Spacer(),
                      Switch(
                        value: Provider.of<ThemeProvider>(context).isDarkMode,
                        onChanged: (newValue) {
                          Provider.of<ThemeProvider>(context, listen: false)
                              .toggleTheme();
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'John Doe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'View profile',
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
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.trending_up),
              title: Text('Your Sound Capsule'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Listening history'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('setting and privacy'),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.purple,
          title: Text(
            "Cache Music Player",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Logout'),
                    content: Text('Are you sure you want to logout?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: Text('Logout'),
                      ),
                    ],
                  ),
                );
              },
              icon: Icon(
                Icons.logout,
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
              // child: Padding(
              //   padding: EdgeInsets.all(8.0),
              //   child: CircleAvatar(
              //     radius: 20,
              //     backgroundImage: AssetImage(
              //         'assets/profile_pic.jpg'),
              //   ),
              // ),
              child: Icon(
                Icons.account_circle_rounded,
                color: Colors.white,
                size: 35,
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
