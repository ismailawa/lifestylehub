import 'package:flutter/material.dart';
import 'package:life_style_hub/values/colors.dart';

class Videos extends StatefulWidget {
  Videos({Key key}) : super(key: key);

  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
        child: Column(
          children: <Widget>[
            AudioPlayer(),
            Expanded(
              child: Container(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: (1 / 2),
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    return Container(
                      child: Center(
                        child: Text("test"),
                      ),
                    );
                  },
                  itemCount: 12,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AudioPlayer extends StatelessWidget {
  const AudioPlayer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Something in the way"),
                SizedBox(
                  height: 5,
                ),
                Text("Nigeria"),
                SizedBox(
                  height: 5,
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      height: 2,
                      width: 180,
                      decoration: BoxDecoration(color: Colors.white),
                    ),
                    Container(
                      height: 2,
                      width: 100,
                      decoration: BoxDecoration(color: accentColor),
                    )
                  ],
                )
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.pause,
              size: 30,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.fast_forward,
              size: 30,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
