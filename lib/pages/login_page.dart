import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Logo(),
                customTextFormField("Username", MaterialCommunityIcons.account),
                customTextFormField("Password", MaterialCommunityIcons.lock, hideText: true),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Text("Forget Your Password?"),
                ),
                MaterialButton(
                  onPressed: () {},
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
                  color: Color(0xFFADADAD),
                ),
                optionalDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SocialMediaIcon(icon: MaterialCommunityIcons.facebook,),
                    SocialMediaIcon(icon: MaterialCommunityIcons.twitter,),
                    SocialMediaIcon(icon: MaterialCommunityIcons.google_plus,)
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
            color: Colors.white,
          ),
          Container(
            height: 50,
            width: 50,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: backgroundColor),
            child: Center(child: Text("Or")),
          )
        ],
      ),
    );
  }

  Padding customTextFormField(String hint, IconData icon, {bool hideText=false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        obscureText: hideText,
        decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: inputBackgroundColor,
            filled: true,
            prefixIcon: Icon(icon),
            hintText: hint),
      ),
    );
  }
}




