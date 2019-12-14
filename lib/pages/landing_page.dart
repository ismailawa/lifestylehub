import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:life_style_hub/values/colors.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final GlobalKey<ScaffoldState> _ScaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _ScaffoldKey,
      backgroundColor: backgroundColor,
      appBar: customAppBar(_ScaffoldKey),
      drawer: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
        child: Drawer(
          child: Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ReflectionHeader(),
            ReflectionCard(),
            Container(
              height: 220,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text("CATEGORIES", style: TextStyle(fontSize: 20),),
                  ),
                  CategoryCard()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar customAppBar(GlobalKey<ScaffoldState> key) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      leading: InkWell(
        onTap: () {
          key.currentState.openDrawer();
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Container(
            width: 30,
            height: 25,
            decoration: BoxDecoration(
                color: Color(0xFF1A1B1F),
                borderRadius: BorderRadius.circular(8)),
            child: Icon(
              MaterialCommunityIcons.view_split_vertical,
              size: 45,
            ),
          ),
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 10, bottom: 10),
          child: Container(
            width: 30,
            height: 25,
            decoration: BoxDecoration(
                color: Color(0xFF1A1B1F),
                borderRadius: BorderRadius.circular(5)),
            child: Icon(
              MaterialCommunityIcons.bookmark_outline,
              size: 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 10, bottom: 10),
          child: Container(
            width: 30,
            height: 25,
            decoration: BoxDecoration(
                color: Color(0xFF1A1B1F),
                borderRadius: BorderRadius.circular(5)),
            child: Icon(
              MaterialCommunityIcons.settings,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}

class ReflectionHeader extends StatelessWidget {
  const ReflectionHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "QUOTE OF THE DAY",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Text(
                "Put down your plans and thought!",
                style:
                    TextStyle(wordSpacing: 4, color: Color(0xFF91959E)),
              ),
              Expanded(
                child: Container(),
              ),
              Text(
                "Go to Diary",
                style: TextStyle(
                    color: Color(0xFFD51042),
                    decoration: TextDecoration.underline,
                    fontSize: 18),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 10),
          child: Text("Leadership", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Row(
            children: <Widget>[
              Text("5 trainers,",style: TextStyle(fontStyle: FontStyle.italic)),
              Text("50 lessons",style: TextStyle(fontStyle: FontStyle.italic))
            ],
          ),
        )
      ],
    );
  }
}

class ReflectionCard extends StatelessWidget {
  const ReflectionCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 180,
          width: MediaQuery.of(context).size.width * .98,
          color: Colors.black,
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, bottom: 25),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Flexible(
                      flex: 3,
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                    Flexible(
                      flex: 6,
                      child: Container(
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, left: 10, right: 10),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "My name, my origin,my backgroun and my experiences are what leveraged my success. The angle of the immigrant,through which i exmined the rality in france,distinguished me.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontStyle: FontStyle.italic,
                                    letterSpacing: 1),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text("- Gad Elmalch -"),
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "quoteparrel.com",
                                    style: TextStyle(fontSize: 10),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                left: 30,
                child: MaterialButton(
                  onPressed: () {},
                  color: accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Listen",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RichText(
                text: TextSpan(children: [
                  TextSpan(text: "QUOTE ON "),
                  TextSpan(
                      text: " SUCCESS", style: TextStyle(color: accentColor))
                ], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Today,17,Nov 2019",
                style: TextStyle(letterSpacing: 2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      "View all",
                      style: TextStyle(color: accentColor, fontSize: 16),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Divider(
            thickness: 2,
          ),
        )
      ],
    );
  }
}
