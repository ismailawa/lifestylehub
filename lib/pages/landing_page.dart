import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:life_style_hub/bloc/Reflections.dart';
import 'package:life_style_hub/helpers/helper.dart';
import 'package:life_style_hub/model/model.dart';
import 'package:life_style_hub/models/category.dart';
import 'package:life_style_hub/pages/Messages.dart';
import 'package:life_style_hub/pages/content_page.dart';
import 'package:life_style_hub/pages/login_page.dart';
import 'package:life_style_hub/pages/reflection_page.dart';
import 'package:life_style_hub/providers/repository_provider.dart';
import 'package:life_style_hub/values/colors.dart';
import 'package:life_style_hub/values/values.dart';
import 'package:life_style_hub/widgets/category_card.dart';
import 'package:life_style_hub/widgets/reflection_card.dart';

class LandingPage extends StatefulWidget {
  static const routeName = SCREEN_LANDING;
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _repository = RepositoryProvider().provideRepository();



  String fullNames = "";
  String email = "";

  PageController _controller;

  _LandingPageState(){
    _initValues();
  }

  _initValues() async{
    fullNames = await _repository.getName();
    email = await _repository.getEmail();

    //print("full names: $fullNames");
  }

  List<Widget> pages = [
    ContentPage(), //0
    ReflectionsPage(), //1
    Messages(), //2
    ContentsPage() //3
  ];

  @override
  void initState(){
    super.initState();
    _controller = PageController();
    //bloc.getReflectionList();

    WidgetsBinding.instance
        .addPostFrameCallback((_) {
      setState(() {
        fullNames;
        email;
      });
    });

  }



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
            padding: const EdgeInsets.only(left: 20),
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    DrawerHeader(email: email,name: fullNames,),
                    SizedBox(
                      height: 15,
                    ),
                    DrawerTiles(
                      onPress: () {
                        setState(() {
                          _controller.jumpToPage(0);
                        });
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
                      onPress: () {
                        setState(() {
                          _controller.jumpToPage(2);
                        });
                      },
                    ),
                    DrawerTiles(
                      icon: SimpleLineIcons.calendar,
                      title: "TASKS",
                    ),
                    DrawerTiles(
                      icon: SimpleLineIcons.target,
                      title: "REFLECTION",
                      onPress: () {
                        setState(() {
                          _controller.jumpToPage(1);
                        });
                      },
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
                      onPress: () {
                        setState(() {
                          _controller.jumpToPage(3);
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: MaterialButton(
                        onPressed: ()  async {
                          await _repository.clear();
                          loginScreen();
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 40,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: accentColor),
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
                color: backgroundColor, borderRadius: BorderRadius.circular(8)),
            child: Icon(
              MaterialCommunityIcons.menu,
              size: 45,
              color: LSHBlackColor,
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
                color: backgroundColor, borderRadius: BorderRadius.circular(5)),
            child: Icon(
              MaterialCommunityIcons.bookmark_outline,
              size: 20,
              color: LSHBlackColor,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 10, bottom: 10),
          child: Container(
            width: 30,
            height: 25,
            decoration: BoxDecoration(
                color: backgroundColor, borderRadius: BorderRadius.circular(5)),
            child: Icon(
              MaterialCommunityIcons.settings,
              size: 20,
              color: LSHBlackColor,
            ),
          ),
        ),
      ],
    );
  }


  void loginScreen(){
    NavigatorHelper(_scaffoldKey.currentState.context).showTopScreenPage(LoginPage.routeName, null);
  }
}



class ContentPage extends StatefulWidget {
  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  final _repository = RepositoryProvider().provideRepository();
  ReflectionBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = ReflectionBloc(_repository);
    WidgetsBinding.instance
        .addPostFrameCallback((_) {
      _refreshIndicatorKey.currentState.show();
    });
  }

  Future<void> _refresh() async{
    bloc.getReflectionList();//return null;
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _scaffoldKey,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ReflectionHeader(),
            StreamBuilder<List<Reflection>>(
              stream: bloc.reflectionList,
              builder: (context, AsyncSnapshot<List<Reflection>> reflectionListSnapshot) {
                if (reflectionListSnapshot.hasData) {
                  if(reflectionListSnapshot.data.length > 0)
                    return _reflectionlistWidget(context, reflectionListSnapshot.data);
                  else
                    return  Container(margin: EdgeInsets.only(top: 30.0), child: Center(child: Text('Reflection List is empty'),),);
                } else if (reflectionListSnapshot.hasError) {
                  String errorMsg = reflectionListSnapshot.error.toString();
                  //showToastError(errorMsg);
                  return  Container(margin: EdgeInsets.only(top: 30.0), child: Center(child: Text('$errorMsg'),),);
                } else {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: Center(child: NavigatorHelper.loadingWaves(accentColor),)
                  );
                }
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CallToAction(
                      title: "Call",
                    ),
                    CallToAction(
                      title: "Follow-up",
                    ),
                    CallToAction(
                      title: "Write",
                    ),
                    CallToAction(
                      title: "Visit",
                    )
                  ],
                ),
              ),
            ),
            Center(
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width * .95,
                height: 40,
                onPressed: () {},
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(text: "View All "),
                    TextSpan(
                        text: "To-do List",
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ], style: TextStyle(color: LSHBlackColor, fontSize: 18)),
                ),
                color: accentColor,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "CATEGORIES",
                          style: TextStyle(fontSize: 20, color: LSHBlackColor),
                        ),
                        Text(
                          "View all",
                          style: TextStyle(fontSize: 20, color: LSHBlackColor),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            Navigator.of(context).pushNamed("cat-view");
                          },
                          child: CategoryCard(
                            category: categories[index],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );

  }

  _reflectionlistWidget(context, List<Reflection> reflectionList){
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: reflectionList.length,
          itemBuilder: (context, index){
            return ReflectionCard(reflection: reflectionList[index],);
          }),
    );
  }

}


class DrawerHeader extends StatelessWidget {
  final String name;
  final String email;

  const DrawerHeader({
    Key key,
    this.name,
    this.email
  })
 : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Column(
        children: <Widget>[
          Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
                color: Colors.white10,
                border: Border.all(
                  color: LSHBlackColor,
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
                  "$name",
                  style: TextStyle(fontSize: 20, color: LSHBlackColor),
                ),
                Text(
                  "$email",
                  style: TextStyle(color: LSHBlackColor),
                ),
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
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, top: 5),
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
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: LSHBlackColor),
            )
          ],
        ),
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
            "REFLECTIONS",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: LSHBlackColor),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Text(
                "Put down your plans and thought!",
                style: TextStyle(wordSpacing: 4, color: LSHBlackColor),
              ),
              Expanded(
                child: Container(),
              ),
              Text(
                "Go to Diary",
                style: TextStyle(
                    color: accentColor,
                    decoration: TextDecoration.underline,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    );
  }
}
