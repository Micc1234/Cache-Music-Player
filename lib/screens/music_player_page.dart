import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:cache_music_player/models/data_provider.dart';
import 'package:cache_music_player/models/music_class_model.dart';
import 'package:cache_music_player/screens/first_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MusicPlayer extends StatefulWidget {
  MusicPlayer({Key? key, required this.musicList, required this.initialIndex})
      : super(key: key);

  final List<Music> musicList;
  final int initialIndex;

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool isHighQuality = false;
  late PageController _pageController;
  int currentIndex = 0;
  Timer? _sleepTimer;
  Duration _sleepDuration = Duration.zero;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: currentIndex);

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

    audioPlayer.onPlayerComplete.listen((event) {
      if (currentIndex < widget.musicList.length - 1) {
        _pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  Future setAudio() async {
    await audioPlayer.setSource(
      AssetSource(widget.musicList[currentIndex].id.toString() + ".mp3"),
    );
    await audioPlayer.resume();
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) {
      return n.toString().padLeft(2, '0');
    }

    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return '$minutes : $seconds';
  }

  void _startSleepTimer(Duration duration) {
    setState(() {
      _sleepDuration = duration;
    });
    _sleepTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_sleepDuration.inSeconds > 0) {
          _sleepDuration = _sleepDuration - Duration(seconds: 1);
        } else {
          audioPlayer.stop();
          audioPlayer.release();
          _sleepTimer?.cancel();
        }
      });
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            'Your sleep timer is set for ${_sleepDuration.inMinutes.remainder(60).toString().padLeft(2, '0')} minutes'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        final provider = Provider.of<DataProvider>(context, listen: false);
        bool isFavorite =
            provider.getFavList().contains(widget.musicList[currentIndex]);

        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          widget.musicList[widget.initialIndex].imgSrc),
                    ),
                    title: Text(widget.musicList[widget.initialIndex].name),
                    subtitle:
                        Text(widget.musicList[widget.initialIndex].singer),
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
                        provider.removeFromFav(
                            widget.musicList[widget.initialIndex]);
                      } else {
                        provider
                            .addToFav(widget.musicList[widget.initialIndex]);
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
                  ListTile(
                    leading: Icon(Icons.timer,
                        color: _sleepDuration.inSeconds > 0
                            ? Colors.purple
                            : null),
                    title: Text('Sleep Timer'),
                    trailing: _sleepDuration.inSeconds > 0
                        ? Text(
                            '${_sleepDuration.inMinutes.remainder(60).toString().padLeft(2, '0')} min left')
                        : null,
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  title: Text('5 minutes'),
                                  onTap: () {
                                    _startSleepTimer(Duration(minutes: 5));
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: Text('10 minutes'),
                                  onTap: () {
                                    _startSleepTimer(Duration(minutes: 10));
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: Text('15 minutes'),
                                  onTap: () {
                                    _startSleepTimer(Duration(minutes: 15));
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: Text('30 minutes'),
                                  onTap: () {
                                    _startSleepTimer(Duration(minutes: 30));
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: Text('45 minutes'),
                                  onTap: () {
                                    _startSleepTimer(Duration(minutes: 45));
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: Text('1 hour'),
                                  onTap: () {
                                    _startSleepTimer(Duration(hours: 1));
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
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
    return PopScope(
      canPop: false,
      onPopInvoked: (pop) async {
        await audioPlayer.stop();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => FirstPage()),
        );
      },
      child: Scaffold(
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
        body: PageView.builder(
          controller: _pageController,
          onPageChanged: (index) async {
            setState(() {
              currentIndex = index;
            });
            await audioPlayer.stop();
            setAudio();
          },
          itemCount: widget.musicList.length,
          itemBuilder: (context, index) {
            final music = widget.musicList[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  child: Image.network(
                    music.imgSrc,
                    width: double.infinity,
                    height: 350,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 32),
                Text(
                  music.name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(music.singer, style: TextStyle(fontSize: 20)),
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
                        if (currentIndex > 0) {
                          _pageController.previousPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
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
                        if (currentIndex < widget.musicList.length - 1) {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
