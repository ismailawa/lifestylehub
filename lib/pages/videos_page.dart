import 'package:flutter/material.dart';
import 'package:life_style_hub/values/colors.dart';
import 'package:life_style_hub/widgets/media_card.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class Videos extends StatefulWidget {
  Videos({Key key}) : super(key: key);
  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  String mediaUrl = "assets/videos/default.mp4";
  VideoPlayerController _playerController;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _playerController = VideoPlayerController.asset(mediaUrl);
    _chewieController = ChewieController(
      videoPlayerController: _playerController,
      autoInitialize: true,
      aspectRatio: 3 / 2,
      looping: false,
      autoPlay: false,
    );
  }

  @override
  void dispose() {
    _chewieController.dispose();
    _playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              backgroundColor: accentColor,
              icon: Icon(Icons.videocam),
              title: Text("")),
          BottomNavigationBarItem(
              backgroundColor: accentColor,
              icon: Icon(Icons.home),
              title: Text("")),
          BottomNavigationBarItem(
              backgroundColor: accentColor,
              icon: Icon(Icons.search),
              title: Text("")),
          BottomNavigationBarItem(
              backgroundColor: accentColor,
              icon: Icon(Icons.folder),
              title: Text(""))
        ],
      ),
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
        child: Column(
          children: <Widget>[
            Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Chewie(
                    controller: _chewieController,
                  ),
                )),
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
//                    return InkWell(
//                      onTap: () {
//                        setState(() {
//                          _chewieController.dispose();
//                          _playerController.pause();
//                          _playerController.seekTo(Duration(seconds: 0));
//                          _playerController = VideoPlayerController.asset(
//                              reflections[index].videoUrl);
//                          _chewieController = ChewieController(
//                            videoPlayerController: _playerController,
//                            autoInitialize: true,
//                            aspectRatio: 3 / 2,
//                            looping: false,
//                            autoPlay: false,
//                          );
//                        });
//                      },
//                      child: MediaCard(
//                        reflection: reflections[index],
//                      ),
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

class LSHVideoPlayer extends StatefulWidget {
  @override
  _LSHVideoPlayerState createState() => _LSHVideoPlayerState();
}

class _LSHVideoPlayerState extends State<LSHVideoPlayer> {
  String mediaUrl = "assets/videos/default.mp4";
  VideoPlayerController _playerController;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _playerController = VideoPlayerController.asset(mediaUrl);
    _chewieController = ChewieController(
      videoPlayerController: _playerController,
      autoInitialize: true,
      aspectRatio: 3 / 2,
      looping: false,
      autoPlay: false,
    );
  }

  @override
  void dispose() {
    _chewieController.dispose();
    _playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Chewie(
            controller: _chewieController,
          ),
        ));
  }
}
