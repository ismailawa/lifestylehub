import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:life_style_hub/models/reflection.dart';
import 'package:life_style_hub/values/values.dart';

class ReflectionsPage extends StatefulWidget {
  @override
  _ReflectionsPageState createState() => _ReflectionsPageState();
}

class _ReflectionsPageState extends State<ReflectionsPage> {
  PageController _pageController = PageController();
  int selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
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
                  tabHeaderBtn("DIARY", true, 0),
                  tabHeaderBtn("TO-DOs", false, 1),
                  tabHeaderBtn("REFLECTIONS", false, 2),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: PageView(
                onPageChanged: (index) {
                  setState(() {
                    selectedPage = index;
                  });
                },
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    child: Center(
                      child: Text("DIARY"),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text("TO-DOs"),
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Text(""))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> nestedListBuilder() {
    var views = [];
    reflectionByMonths.forEach((month, reflections) {
      views.add(Container(
        child: Text(month),
      ));
    });

    return views;
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
          child: Center(child: Text(title,style: TextStyle(color: LSHBlackColor),)),
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
