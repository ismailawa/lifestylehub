import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:life_style_hub/values/strings.dart';
import 'dart:io' show Platform;
import 'package:life_style_hub/values/values.dart';
import 'package:life_style_hub/helpers/helper.dart';
import 'package:progress_dialog/progress_dialog.dart';

class NavigatorHelper {
  BuildContext context;

  NavigatorHelper(this.context);

  replaceScreen(StatefulWidget newScreen) {
    if (newScreen != null) {
      var newRoute = MaterialPageRoute(builder: (context) => newScreen);
      Navigator.pushReplacement(context, newRoute);
    }
  }

  //shows a screen on top of another
  showScreen(String routeName, dynamic screen) {
    // When the user taps the button, navigate to the specific route
    // and provide the arguments as part of the RouteSettings.
    Navigator.pushNamed(
      context,
      routeName,
      arguments: screen,
    );
  }

  //shows a screen and return a value. Used mostly for dialog
  showScreenWithReturn(String routeName, dynamic screen) async {
    return await Navigator.pushNamed(
      context,
      routeName,
      arguments: screen,
    );
  }

  //remove all pages on the stack and place only this one
  showTopScreenPage(String routeName, dynamic args) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      routeName,
      ModalRoute.withName(SCREEN_LANDING),
      arguments: args,
    );
  }

  showMainScreen(dynamic args) {
    Navigator.of(context).pushReplacementNamed(
      SCREEN_LANDING,
      arguments: args,
    );
  }

  showOnboardingScreen() {
    Navigator.of(context).pushReplacementNamed(SCREEN_ONBOARDING);
  }

  showLoginPageAfterLogout() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(SCREEN_LOGIN, (Route<dynamic> route) => false);
  }

  closeScreen() {
    Navigator.pop(context);
    //Navigator.of(context).pop();
  }

  closeScreenAndReturnValues(dynamic args) {
    Navigator.pop(context, args);
    //Navigator.of(context).pop();
  }

  static loadingWaves(Color color) {
    return SpinKitWave(
      color: color,
      size: 30.0,
    );
  }

  static appBar(String title,
      {String leadingImageName, Function onTapLeadingIcon}) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: appBarTextWidget(title),
      leading: AppBarLeadingWidget(
        onTapLeadingIcon,
        imageName: leadingImageName,
      ),
    );
  }

  static appBarTextWidget(String title) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.white,
          fontFamily: 'Poppins',
          fontSize: 18.0,
          fontWeight: FontWeight.w300),
    );
  }

  void showToast(GlobalKey<ScaffoldState> scaffoldKey, String message) {
    try {
      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(message),
          /*action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),*/
        ),
      );
    } catch (e) {}
  }

  ProgressDialog createProgressDialog({String message}) {
    var pd = new ProgressDialog(context, type: ProgressDialogType.Normal);
    pd.style(
      message: message,
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      //progressWidget: Container(height: 5.0, width: 5.0, child: CircularProgressIndicator(),),
      progressWidget: Container(
        height: 10.0,
        width: 10.0,
        child: new Image(image: new AssetImage("assets/images/loading.gif")),
      ),
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
    );
    return pd;
  }

  static IconData getIconData() =>
      Platform.isIOS ? CupertinoIcons.back : Icons.arrow_back;
}

class AppBarLeadingWidget extends StatelessWidget {
  final Function onTap;
  final String imageName;

  AppBarLeadingWidget(this.onTap, {this.imageName});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onTap, child: getIcon());
  }

  dynamic getIcon() => (imageName != null
      ? Image.asset('images/$imageName.png')
      : Icon(
          getIconData(),
          color: Colors.white,
        ));

  /// if device is iOS, use cupertino back icon, else, use material design back icon
  IconData getIconData() =>
      Platform.isIOS ? CupertinoIcons.back : Icons.arrow_back;
}

class AppBarLeadingWidgetMenu extends StatelessWidget {
  final Function onTap;
  final String imageName;

  AppBarLeadingWidgetMenu(this.onTap, {this.imageName});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onTap, child: getIcon());
  }

  dynamic getIcon() => (imageName != null
      ? Image.asset('images/$imageName.png')
      : Icon(
          getIconData(),
          color: Colors.white,
        ));

  /// if device is iOS, use cupertino back icon, else, use material design back icon
  IconData getIconData() =>
      Platform.isIOS ? CupertinoIcons.back : Icons.arrow_back;
}
