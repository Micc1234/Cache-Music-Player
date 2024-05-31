import 'package:cache_music_player/models/music_class_model.dart';
import 'package:cache_music_player/screens/music_player_page.dart';
import 'package:cache_music_player/widgets/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cache_music_player/models/data_provider.dart';
import 'package:cache_music_player/screens/login_page.dart';
import 'package:cache_music_player/screens/first_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => DataProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Music sample = Music(
        name: "Monokrom",
        singer: "Tulus",
        imgSrc:
            "https://i.scdn.co/image/ab67616d0000b27371c65edbeed32af70b900637",
        favorite: false,
        lang: "Indonesian");
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeProvider.currentTheme,
          home: FirstPage(),
        );
      },
    );
  }
}
