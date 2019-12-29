import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:life_style_hub/values/values.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:life_style_hub/widgets/logo_widget.dart';
import 'package:life_style_hub/widgets/social_media_icon.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          width: ScreenUtil.mediaQueryData.size.width,
          height: ScreenUtil.mediaQueryData.size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Logo(),
                customTextFormField("Username", MaterialCommunityIcons.account),
                customTextFormField("Password", MaterialCommunityIcons.lock,
                    hideText: true),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed("forget");
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      "Forget Your Password?",
                      style: TextStyle(color: LSHBlackColor),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("landing-page");
                  },
                  child: Text("LOGIN"),
                  minWidth: double.infinity,
                  height: 45,
                  color: accentColor,
                ),
                SizedBox(
                  height: 8,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('register');
                  },
                  child: Text("REGISTER"),
                  minWidth: double.infinity,
                  height: 45,
                  color: LSHBlackColor,
                ),
                optionalDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SocialMediaIcon(
                      icon: MaterialCommunityIcons.facebook,
                    ),
                    SocialMediaIcon(
                      icon: MaterialCommunityIcons.twitter,
                    ),
                    SocialMediaIcon(
                      icon: MaterialCommunityIcons.google_plus,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding optionalDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 0.5,
            color: LSHBlackColor,
          ),
          Container(
            height: 50,
            width: 50,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: backgroundColor),
            child: Center(
                child: Text(
              "Or",
              style: TextStyle(
                color: LSHBlackColor,
              ),
            )),
          )
        ],
      ),
    );
  }

  Padding customTextFormField(String hint, IconData icon,
      {bool hideText = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: TextFormField(
          obscureText: hideText,
          decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: inputBackgroundColor,
              filled: true,
              prefixIcon: Icon(icon),
              hintText: hint),
        ),
      ),
    );
  }
}
