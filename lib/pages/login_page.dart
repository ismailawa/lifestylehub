import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:life_style_hub/helpers/helper.dart';
import 'package:life_style_hub/pages/pages.dart';
import 'package:life_style_hub/providers/repository_provider.dart';
import 'package:life_style_hub/values/values.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:life_style_hub/widgets/logo_widget.dart';
import 'package:life_style_hub/widgets/social_media_icon.dart';

class LoginPage extends StatefulWidget {
  static const routeName = SCREEN_LOGIN;
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _repository = RepositoryProvider().provideRepository();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ProgressDialog pd;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);
    return Scaffold(
      key: _scaffoldKey,
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
                customTextFormField("Username", MaterialCommunityIcons.account,
                    emailController),
                customTextFormField(
                    "Password", MaterialCommunityIcons.lock, passwordController,
                    hideText: true),
                InkWell(
                  onTap: () {
                    forgotPasswordScreen();
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
                    _onLoginPressed();
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
                    registerScreen();
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

  Padding customTextFormField(
      String hint, IconData icon, TextEditingController textController,
      {bool hideText = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: TextFormField(
          obscureText: hideText,
          controller: textController,
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

  _onLoginPressed() async {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isEmpty) {
      showToast(ERR_EMAIL_REQUIRED);
      return;
    }

    if (!isEmailValid(email)) {
      showToast(ERR_INVALID_EMAIL);
      return;
    }

    if (password.isEmpty) {
      showToast(ERR_PASSWORD_REQUIRED);
      return;
    }

    pd = NavigatorHelper(_scaffoldKey.currentState.context)
        .createProgressDialog(message: TEXT_LOADING);

    pd.show();

//    try {
    var response = await _repository.login(email, password);

    if (response.isConnectionSuccessful()) {
      if (!response.isRequestSuccessful()) {
        //user already exists, save the email address and take him to the mainscreen
        pd.hide();
        showToast(response.message);
      } else {
        pd.hide();
        //user does not exist, send him an otp and take him to the otp page for verification of account
        await _repository.setLogin(true);
        await _repository.setName('${response.data.fullName}');
        await _repository.setEmail(email);
        await _repository.setToken(response.token);
        reflectionScreen();
      }
    } else {
      pd.hide();
      showToast(response.formattedErrMessage);
    }
//    }catch(e){
//      showToast(e.toString());
//    }
  }

  void forgotPasswordScreen() {
    NavigatorHelper(_scaffoldKey.currentState.context)
        .showScreen(ForgetPasswordPage.routeName, null);
  }

  void reflectionScreen() {
    NavigatorHelper(_scaffoldKey.currentState.context)
        .showTopScreenPage(LandingPage.routeName, null);
  }

  void registerScreen() {
    NavigatorHelper(_scaffoldKey.currentState.context)
        .showScreen(RegisterPage.routeName, null);
  }

  showToast(String message) {
    NavigatorHelper(_scaffoldKey.currentState.context)
        .showToast(_scaffoldKey, message);
  }

  bool isEmailValid(String email) => RegExp(REG_EXP_EMAIL).hasMatch(email);
}
