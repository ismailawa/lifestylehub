import 'package:flutter/material.dart';
import 'package:life_style_hub/model/reflection.dart';

class MediaCard extends StatelessWidget {
  final Reflection reflection;
  const MediaCard({
    Key key,
    this.reflection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage("${reflection.imageLink}"),
                fit: BoxFit.cover),
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("${reflection.author}"),
              SizedBox(
                height: 5,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "5 Trainers, 50 Lessons",
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
