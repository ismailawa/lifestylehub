import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:life_style_hub/models/reflection.dart';
import 'package:life_style_hub/values/values.dart';

class CategoryView extends StatefulWidget {
  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  int selectedPage = 0;
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: NestedScrollView(
        headerSliverBuilder: (context, n) {
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
                        color: Colors.black54,
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
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(5)),
                    child: Icon(
                      MaterialCommunityIcons.bookmark_outline,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10, right: 10, bottom: 10),
                  child: Container(
                    width: 30,
                    height: 25,
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(5)),
                    child: Icon(
                      MaterialCommunityIcons.settings,
                      size: 20,
                      color: Colors.white,
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
                              image: AssetImage("assets/images/cat1.jpg"),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Leadership",
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Leadership is about building the capacity you need in managing and carrying people along in what you are doing.As well as get their buy....",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white38,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ];
        },
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(),
                  child: Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      tabHeaderBtn("AUTHORS", true, 0),
                      tabHeaderBtn("ABOUT", false, 1),
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
                      child: AuthorsCard(),
                    ),
                    Container(
                      child: Center(
                        child: Text("About"),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
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
              border: Border(
                  bottom: BorderSide(
            color: selectedPage == page ? accentColor : Color(0xFF121922),
            width: 5,
          ))),
        ),
      ),
    );
  }
}

class AuthorsCard extends StatelessWidget {
  const AuthorsCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemCount: reflections.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                ClipRRect(
                  child: Container(
                    child: Image.asset(
                      reflections[index].imageUrl,
                      fit: BoxFit.fitHeight,
                    ),
                    height: 100,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                Text(
                  reflections[index].author,
                  style: TextStyle(color: Colors.black87),
                )
              ],
            );
          },
        ));
  }
}
