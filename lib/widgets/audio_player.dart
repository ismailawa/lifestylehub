import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:audio/audio.dart';
import 'package:flutter/material.dart';
import 'package:life_style_hub/providers/api_provider.dart';

const _KEY_AUTHORIZATION = "Authorization";
const _KEY_CONTENT_TYPE = "Content-type";
const _KEY_BEARER = "Bearer";

class AudioPlayer extends StatefulWidget {
  final String url;

  AudioPlayer({Key key, this.url}) : super(key: key);

  @override
  _AudioPlayerState createState() => _AudioPlayerState();
}

class _AudioPlayerState extends State<AudioPlayer> {
  Audio audioPlayer = new Audio(single: true);
  AudioPlayerState state = AudioPlayerState.STOPPED;
  double position = 0;
  StreamSubscription<AudioPlayerState> _playerStateSubscription;
  StreamSubscription<double> _playerPositionController;
  StreamSubscription<int> _playerBufferingSubscription;
  StreamSubscription<AudioPlayerError> _playerErrorSubscription;

  _getAudio(String url) async {
    var header = await _getNormalHeader();
    var response = await http.get(url, headers: header);
    print(jsonDecode(response.body));
  }

  Future<Map<String, String>> _getNormalHeader() async {
    var header = Map<String, String>();
    header[_KEY_CONTENT_TYPE] = "application/json";

    String token = await getToken();
    //print('token: $token');
    if (token != null && token.isNotEmpty) {
      header[_KEY_AUTHORIZATION] = "$_KEY_BEARER $token";
    }

    return header;
  }

  @override
  void initState() {
    _getAudio(widget.url);
    _playerStateSubscription =
        audioPlayer.onPlayerStateChanged.listen((AudioPlayerState state) {
      print("onPlayerStateChanged: ${audioPlayer.uid} $state");
      if (mounted) setState(() => this.state = state);
    });

    _playerPositionController =
        audioPlayer.onPlayerPositionChanged.listen((double position) {
      print(
          "onPlayerPositionChanged: ${audioPlayer.uid} $position ${audioPlayer.duration}");

      if (mounted) setState(() => this.position = position);
    });

    _playerBufferingSubscription =
        audioPlayer.onPlayerBufferingChanged.listen((int percent) {
      print("onPlayerBufferingChanged: ${audioPlayer.uid} $percent");
    });

    _playerErrorSubscription =
        audioPlayer.onPlayerError.listen((AudioPlayerError error) {
      throw ("onPlayerError: ${error.code} ${error.message}");
    });

    audioPlayer.preload(widget.url);
    super.initState();
  }

  @override
  void dispose() {
    _playerStateSubscription.cancel();
    _playerPositionController.cancel();
    _playerBufferingSubscription.cancel();
    _playerErrorSubscription.cancel();
    audioPlayer.release();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget status = Container();

    switch (state) {
      case AudioPlayerState.LOADING:
        {
          status = Container(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                  child: Center(
                      child: CircularProgressIndicator(strokeWidth: 2.0)),
                  width: 24.0,
                  height: 24.0));
          break;
        }

      case AudioPlayerState.PLAYING:
        {
          status = IconButton(
              icon: Icon(Icons.pause, size: 28.0), onPressed: onPause);
          break;
        }

      case AudioPlayerState.READY:
      case AudioPlayerState.PAUSED:
      case AudioPlayerState.STOPPED:
        {
          status = IconButton(
              icon: Icon(Icons.play_arrow, size: 28.0), onPressed: onPlay);

          if (state == AudioPlayerState.STOPPED) audioPlayer.seek(0.0);

          break;
        }
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
      child: Column(
        children: <Widget>[
          Text(audioPlayer.uid),
          Row(
            children: <Widget>[
              status,
              Slider(
                max: audioPlayer.duration.toDouble(),
                value: position.toDouble(),
                onChanged: onSeek,
              ),
              Text("${audioPlayer.duration.toDouble()}ms")
            ],
          )
        ],
      ),
    );
  }

  onPlay() {
    audioPlayer.play(widget.url);
  }

  onPause() {
    audioPlayer.pause();
  }

  onSeek(double value) {
    audioPlayer.seek(value);
  }
}
