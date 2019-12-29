import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:life_style_hub/values/values.dart';

class AuthorView extends StatefulWidget {
  @override
  _AuthorViewState createState() => _AuthorViewState();
}

class _AuthorViewState extends State<AuthorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, n){
          return [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              expandedHeight: 350,
              floating: false,
              pinned: true,
              leading: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8)),
                    child: Icon(
                      MaterialCommunityIcons.arrow_left,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              actions: <Widget>[
                Padding(
                  padding:
                  const EdgeInsets.only(top: 10, right: 10, bottom: 10),
                  child: Container(
                    width: 30,
                    height: 25,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(5)),
                    child: Icon(
                      Icons.favorite_border,
                      size: 30,
                      color: accentColor,
                    ),
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: [StretchMode.blurBackground],
                collapseMode: CollapseMode.parallax,
                background: Stack(
                  children: <Widget>[
                    Container(
                      height: 400,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/p1.jpg"),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.transparent, Colors.black])),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 25),
                      child: Container(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Jony Blake",
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 15,
                            ),

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ];
        },
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AuthorsStatisticsBar(
                followers: 125,
                subscriptions: 150,
                likes: 321,
              )
            ],
          ),
        ),
      )
    );
  }
}

class AuthorsStatisticsBar extends StatelessWidget {
  final int followers;
  final int subscriptions;
  final int likes;
  const AuthorsStatisticsBar({
    Key key, this.followers=0, this.subscriptions=0, this.likes=0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text("$followers", style: TextStyle(color: LSHBlackColor, fontSize: 26, fontWeight: FontWeight.w800),),
              Text("FOLLOWERS",style: TextStyle(color: Colors.black87, fontSize: 16, ),),
            ],
          ),
          Column(
            children: <Widget>[
              Text("$subscriptions", style: TextStyle(color: LSHBlackColor, fontSize: 26, fontWeight: FontWeight.w800),),
              Text("SUBSCRIPTIONS",style: TextStyle(color: Colors.black87, fontSize: 16, ),),
            ],
          ),
          Column(
            children: <Widget>[
              Text("$likes", style: TextStyle(color: LSHBlackColor, fontSize: 26, fontWeight: FontWeight.w800),),
              Text("LIKES",style: TextStyle(color: Colors.black87, fontSize: 16, ),),
            ],
          )
        ],
      ),
    );
  }
}
