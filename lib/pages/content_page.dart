import 'package:flutter/material.dart';
import 'package:life_style_hub/pages/videos_page.dart';
import 'package:life_style_hub/values/values.dart';

class ContentsPage extends StatefulWidget {
  ContentsPage({Key key}) : super(key: key);

  @override
  _ContentsPageState createState() => _ContentsPageState();
}

class _ContentsPageState extends State<ContentsPage> {
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
                  tabHeaderBtn("VIDEOS", true, 0),
                  tabHeaderBtn("AUDIOS", false, 1),
                  tabHeaderBtn("EBOOKS", false, 2),
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
                  Videos(),
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
          child: Center(child: Text(title)),
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
