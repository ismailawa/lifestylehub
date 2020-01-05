import 'package:flutter/material.dart';
import 'package:life_style_hub/values/values.dart';
import 'package:life_style_hub/pages/pages.dart';
import 'package:life_style_hub/helpers/helper.dart';
import 'package:life_style_hub/providers/repository_provider.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = SCREEN_SPLASHSCREEN;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final repository = RepositoriesProvider().provideRepository();

  @override
  void initState() {
    super.initState();
    //print('date now() -> ${new DateTime.now().millisecondsSinceEpoch}');
    sleepAndReplaceScreen();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      backgroundColor: backgroundColor,
      body: Center(
        child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/hub.png',
                  width: 180,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(APP_NAME),
              ]),
        ),
      ),
    );
  }

  Future sleepAndReplaceScreen() async {
    await Future.delayed(const Duration(seconds: 3));

    var isLogin = await repository.isLogin();
    if (isLogin == null || !isLogin) {
      loginScreen();
    } else {
      reflectionScreen();
    }
  }

  void reflectionScreen() {
    NavigatorHelper(scaffoldKey.currentState.context)
        .showTopScreenPage(LandingPage.routeName, null);
  }

  void loginScreen() {
    NavigatorHelper(scaffoldKey.currentState.context)
        .showTopScreenPage(LoginPage.routeName, null);
  }
}
