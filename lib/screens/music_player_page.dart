import 'package:audioplayers/audioplayers.dart';
import 'package:cache_music_player/models/data_provider.dart';
import 'package:cache_music_player/models/music_class_model.dart';
import 'package:cache_music_player/screens/first_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MusicPlayer extends StatefulWidget {
  MusicPlayer({Key? key, required this.music}) : super(key: key);

  final Music music;

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool isHighQuality = false;

  @override
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
    audioPlayer.setSource(AssetSource(widget.music.id.toString() + ".mp3"));
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) {
      return n.toString().padLeft(2, '0');
    }

    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return '$minutes : $seconds';
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        final provider = Provider.of<DataProvider>(context, listen: false);
        bool isFavorite = provider.getFavList().contains(widget.music);

        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(widget.music.imgSrc),
                    ),
                    title: Text(widget.music.name),
                    subtitle: Text(widget.music.singer),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : null,
                    ),
                    title: Text(isFavorite
                        ? 'Remove from Favorite'
                        : 'Add to Favorite'),
                    onTap: () {
                      if (isFavorite) {
                        provider.removeFromFav(widget.music);
                      } else {
                        provider.addToFav(widget.music);
                      }
                      Navigator.pop(context);
                    },
                  ),
                  SwitchListTile(
                    title: Text('High Quality'),
                    secondary: Icon(Icons.audiotrack),
                    value: isHighQuality,
                    onChanged: (value) {
                      setState(() {
                        isHighQuality = value;
                      });
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => FirstPage()),
            );
          },
          icon: Icon(Icons.arrow_back_sharp),
          iconSize: 35,
          color: Colors.white,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            iconSize: 35,
            color: Colors.white,
            onPressed: _showBottomSheet,
          ),
        ],
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
                Text(formatTime(duration - position)),
              ],
            ),
          ),
          SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.skip_previous),
                iconSize: 50,
                onPressed: () async {
                  await audioPlayer.stop();
                  final prevMusic =
                      Provider.of<DataProvider>(context, listen: false)
                          .getRandomMusic(widget.music);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MusicPlayer(music: prevMusic)),
                  );
                },
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
              ),
              IconButton(
                icon: Icon(Icons.skip_next),
                iconSize: 50,
                onPressed: () async {
                  await audioPlayer.stop();
                  final nextMusic =
                      Provider.of<DataProvider>(context, listen: false)
                          .getRandomMusic(widget.music);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MusicPlayer(music: nextMusic)),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
