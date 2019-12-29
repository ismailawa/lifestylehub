import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:life_style_hub/values/values.dart';

class AuthorView extends StatefulWidget {
  @override
  _AuthorViewState createState() => _AuthorViewState();
}

class _AuthorViewState extends State<AuthorView> {
  int selectedPage = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (context, n) {
        return [
          SliverAppBar(
            backgroundColor: LSHBlackColor,
            elevation: 0,
            expandedHeight: 350,
            floating: true,
            pinned: true,
            centerTitle: true,
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
                padding: const EdgeInsets.only(top: 10, right: 10, bottom: 10),
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
              centerTitle: true,
              title:  Text(
                "Jony Blake",
                style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.w600),
              ),
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

                ],
              ),
            ),
          )
        ];
      },
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AuthorsStatisticsBar(
              followers: 125,
              subscriptions: 150,
              likes: 321,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: LSHBlackColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    tabHeaderBtn("ABOUT", true, 0),
                    tabHeaderBtn("RECENT", false, 1),
                  ],
                ),
              ),
            ),
            Flexible(
              child: PageView(
                onPageChanged: (index) {
                  setState(() {
                    selectedPage = index;
                  });
                },
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed("author-view");
                    },
                    child: Container(
                      color: Colors.red,
                      height: 50,
                    ),
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 15,right: 15, bottom: 20
                        ),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          image: DecorationImage(
                                            image: AssetImage("assets/images/p1.jpg"),
                                            fit: BoxFit.cover
                                          )
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Jony Blake", style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18
                                        ),),
                                        Text("1 hour ago",style: TextStyle(
                                            color: Colors.black54,

                                        ),),
                                      ],
                                    ),

                                  ]
                                ),
                                SizedBox(height: 15,),
                                Text("Your success and happiness lies in you. Resolve to keep happy, and your joy and you shall form an invincible host against difficulties. The sweetest of all sounds is praise", style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16
                                ), textAlign: TextAlign.center,),
                                SizedBox(height: 10,),
                                Divider(
                                  thickness: 1,
                                  color: Colors.black26,
                                ),
                                Row(
                                  children: <Widget>[
                                    IconButton(
                                      onPressed: (){},
                                      icon: Icon(Icons.share),
                                      color: LSHBlackColor,
                                    ),
                                    Expanded(
                                      child: Container(),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("256", style: TextStyle(color: LSHBlackColor),),
                                        IconButton(
                                          onPressed: (){},
                                          icon: Icon(Icons.comment),
                                          color: LSHBlackColor,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("4 K", style: TextStyle(color: LSHBlackColor),),
                                        IconButton(
                                          onPressed: (){},
                                          icon: Icon(Icons.favorite_border),
                                          color: LSHBlackColor,
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(color: accentColor,borderRadius: BorderRadius.circular(10)),
                        ),
                      );
                    },
                    itemCount: 60,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  Flexible tabHeaderBtn(String title, bool isActive, int page) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: InkWell(
        onTap: () {
          setState(() {
            selectedPage = page;
          });
          _pageController.jumpToPage(page);
        },
        child: Container(
          child: Center(
              child: Text(
            title,
            style: TextStyle(
                color: selectedPage == page ? Colors.white : Colors.white38),
          )),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: selectedPage == page ? accentColor : Color(0xFF121922),
          ),
        ),
      ),
    );
  }
}

class AuthorsStatisticsBar extends StatelessWidget {
  final int followers;
  final int subscriptions;
  final int likes;
  const AuthorsStatisticsBar({
    Key key,
    this.followers = 0,
    this.subscriptions = 0,
    this.likes = 0,
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
              Text(
                "$followers",
                style: TextStyle(
                    color: LSHBlackColor,
                    fontSize: 26,
                    fontWeight: FontWeight.w800),
              ),
              Text(
                "FOLLOWERS",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                "$subscriptions",
                style: TextStyle(
                    color: LSHBlackColor,
                    fontSize: 26,
                    fontWeight: FontWeight.w800),
              ),
              Text(
                "SUBSCRIPTIONS",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                "$likes",
                style: TextStyle(
                    color: LSHBlackColor,
                    fontSize: 26,
                    fontWeight: FontWeight.w800),
              ),
              Text(
                "LIKES",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
