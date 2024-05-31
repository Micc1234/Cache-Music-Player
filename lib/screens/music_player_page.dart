import 'package:audioplayers/audioplayers.dart';
import 'package:cache_music_player/models/music_class_model.dart';
import 'package:cache_music_player/screens/first_page.dart';
import 'package:flutter/material.dart';

class MusicPlayer extends StatefulWidget {
  MusicPlayer({super.key, required this.music});

  Music music;
  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  void initState() {
    super.initState();

    setAudio();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  Future setAudio() async {
    audioPlayer.setSource(
        AssetSource(widget.music.name + widget.music.singer + ".mp3"));
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) {
      return n.toString().padLeft(2, '0');
    }

    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return minutes + " : " + seconds;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text(
          "Cache Music Player",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () async {
            await audioPlayer.stop();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FirstPage()));
          },
          icon: Icon(
            Icons.arrow_back_sharp,
          ),
          iconSize: 35,
          color: Colors.white,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            child: Image.network(
              widget.music.imgSrc,
              width: double.infinity,
              height: 350,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 32),
          Text(
            widget.music.name,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(widget.music.singer, style: TextStyle(fontSize: 20)),
          Slider(
            min: 0,
            max: duration.inSeconds.toDouble(),
            value: position.inSeconds.toDouble(),
            onChanged: (value) async {
              final position = Duration(seconds: value.toInt());
              await audioPlayer.seek(position);
              await audioPlayer.resume();
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(formatTime(position)),
                Text(formatTime(duration - position))
              ],
            ),
          ),
          CircleAvatar(
            radius: 35,
            child: IconButton(
              iconSize: 50,
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
              onPressed: () async {
                if (isPlaying) {
                  await audioPlayer.pause();
                } else {
                  await audioPlayer.resume();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
