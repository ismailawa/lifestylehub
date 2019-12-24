import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:life_style_hub/models/category.dart';
import 'package:life_style_hub/models/reflection.dart';
import 'package:life_style_hub/pages/reflection_page.dart';
import 'package:life_style_hub/values/colors.dart';
import 'package:life_style_hub/widgets/category_card.dart';
import 'package:life_style_hub/widgets/reflection_card.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  PageController _controller;
  List<Widget> pages = [
    ContentPage(),
    ReflectionsPage(),
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: backgroundColor,
      appBar: customAppBar(_scaffoldKey),
      drawer: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
        child: Drawer(
          child: Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 40),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
                color: Color(0xFF353A50),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    DrawerHeader(),
                    SizedBox(
                      height: 20,
                    ),
                    DrawerTiles(
                      onPress: () {

                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 45,
                            width: 10,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 45,
                            width: 220,
                            decoration: BoxDecoration(
                                color: accentColor,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.watch_later,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "SUBSCRIPTIONS",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    DrawerTiles(
                      icon: MaterialCommunityIcons.message_processing,
                      title: "MESSAGES",
                    ),
                    DrawerTiles(
                      icon: SimpleLineIcons.calendar,
                      title: "TASKS",
                    ),
                    InkWell(
                      onTap: (){
                        _controller.jumpToPage(1);
                      },
                      child: DrawerTiles(
                        icon: SimpleLineIcons.target,
                        title: "REFLECTION",
                      ),
                    ),
                    DrawerTiles(
                      icon: Icons.shop,
                      title: "DIARY",
                    ),
                    DrawerTiles(
                      icon: Icons.settings,
                      title: "SETTINGS",
                    ),
                    DrawerTiles(
                      icon: Icons.edit,
                      title: "COACHING",
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: MaterialButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 40,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(colors: [
                                    Colors.black,
                                    Color(0xFFA2163B)
                                  ])),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Logout"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.exit_to_app)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: PageView(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        children: pages,
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
              MaterialCommunityIcons.menu,
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


class ContentPage extends StatelessWidget {
  const ContentPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ReflectionHeader(),
            Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: reflections.length,
                    itemBuilder: (context, index) {
                      return ReflectionCard(
                        reflection: reflections[index],
                      );
                    })),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                thickness: 2,
              ),
            ),
            Container(
              height: 280,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      "CATEGORIES",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return CategoryCard(
                          category: categories[index],
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DrawerHeader extends StatelessWidget {
  const DrawerHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Row(
        children: <Widget>[
          Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
                color: Colors.white10,
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                  style: BorderStyle.solid,
                ),
                shape: BoxShape.circle),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Tunde Burby!",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text("gold.oni@gmail.com"),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: MaterialButton(
                    height: 20,
                    onPressed: () {},
                    color: accentColor,
                    child: Text(
                      "profile",
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerTiles extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onPress;
  const DrawerTiles({
    Key key,
    this.icon = MaterialIcons.book,
    this.title = "DASHBOARD",
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.only(left: 30, top: 10),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              size: 30,
              color: Color(0xFF888C98),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200),
            )
          ],
        ),
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
                style: TextStyle(wordSpacing: 4, color: Color(0xFF91959E)),
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
