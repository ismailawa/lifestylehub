import 'package:chewie_audio/chewie_audio.dart';
import 'package:flutter/material.dart';
import 'package:life_style_hub/values/values.dart';
import 'package:life_style_hub/widgets/media_card.dart';
import 'package:video_player/video_player.dart';

class Audios extends StatefulWidget {
  Audios({Key key}) : super(key: key);

  @override
  _AudiosState createState() => _AudiosState();
}

class _AudiosState extends State<Audios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              backgroundColor: accentColor,
              icon: Icon(Icons.music_note),
              title: Text("")),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("")),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("")),
          BottomNavigationBarItem(icon: Icon(Icons.folder), title: Text(""))
        ],
      ),
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
        child: Column(
          children: <Widget>[
            AudioPlayer(),
            SizedBox(
              height: 10,
            ),
//            Expanded(
//              child: Container(
//                child: GridView.builder(
//                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                      crossAxisCount: 3,
//                      childAspectRatio: (0.8),
//                      crossAxisSpacing: 10,
//                      mainAxisSpacing: 10),
//                  itemBuilder: (context, index) {
//                    return MediaCard(
//                      reflection: reflections[index],
//                    );
//                  },
//                  itemCount: reflections.length,
//                ),
//              ),
//            )
          ],
        ),
      ),
    );
  }
}

class AudioPlayer extends StatefulWidget {
  AudioPlayer({Key key}) : super(key: key);

  @override
  _AudioPlayerState createState() => _AudioPlayerState();
}

class _AudioPlayerState extends State<AudioPlayer> {
  VideoPlayerController _playerController;
  ChewieAudioController _chewieAudioController;

  @override
  void initState() {
    _playerController = VideoPlayerController.asset("assets/videos/video.mp4");
    _chewieAudioController = ChewieAudioController(
      materialProgressColors: ChewieProgressColors(
          backgroundColor: Colors.grey, handleColor: Colors.red),
      videoPlayerController: _playerController,
      looping: false,
      autoPlay: false,
      autoInitialize: true,
    );
    super.initState();
  }

  @override
  void dispose() {
    _playerController.dispose();
    _chewieAudioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ChewieAudio(
        controller: _chewieAudioController,
      ),
    );
  }
}
