import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:life_style_hub/values/colors.dart';

class Messages extends StatefulWidget {
  @override
  State createState() => MessagesState();
}

class MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> message = [
      {
        'title': 'Marie Winter',
        'subtitle': 'Hapiness is not something readymade.',
        'image': 'assets/images/p1.jpg',
      },
      {
        'title': 'Grant Marshall',
        'subtitle': 'When I let go of what I am, I become.',
        'image': 'assets/images/p2.jpg',
      },
      {
        'title': 'Duran Clayton',
        'subtitle': "If you're offered a seat on a rocket ship,",
        'image': 'assets/images/p3.jpg',
      },
      {
        'title': 'Marie Winter',
        'subtitle': 'Hapiness is not something readymade.',
        'image': 'assets/images/p1.jpg',
      },
      {
        'title': 'Marie Winter',
        'subtitle': 'Hapiness is not something readymade.',
        'image': 'assets/images/p2.jpg',
      },
    ];

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 16),
              child: Row(children: <Widget>[
                Text(
                  'Messages',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 40.0,
                    color: Colors.white,
                  ),
                ),
              ]),
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.separated(
                    itemBuilder: (context, index) => ListTile(
                      contentPadding: EdgeInsets.only(right: 0.0),
                      title: Text(
                        '${message[index]['title']}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            letterSpacing: 1.0),
                        maxLines: 1,
                      ),
                      subtitle: Text(
                        '${message[index]['subtitle']}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            letterSpacing: 1.0),
                        maxLines: 1,
                      ),
                      leading: Container(
                        width: 80.0,
                        height: 80.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage('${message[index]['image']}'),
                          ),
                        ),
                      ),
                      trailing: Icon(
                        Icons.fiber_manual_record,
                        color: Colors.pinkAccent,
                        size: 8.0,
                      ),
                    ),
                    separatorBuilder: (context, index) => Container(
                      height: 1.0,
                      color: Colors.white70,
                    ),
                    itemCount: message.length,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(left: 96.0, right: 96.0),
              child: Container(
                height: 1.0,
                color: Colors.white30,
                margin: EdgeInsets.only(bottom: 8.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
