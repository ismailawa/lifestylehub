import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:life_style_hub/helpers/helper.dart';
import 'package:life_style_hub/model/model.dart';
import 'package:life_style_hub/pages/pages.dart';
import 'package:life_style_hub/providers/repository_provider.dart';
import 'package:life_style_hub/utils/constants.dart';
import 'package:life_style_hub/values/values.dart';
import 'package:life_style_hub/widgets/logo_widget.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = SCREEN_REGISTER;

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _repository = RepositoriesProvider().provideRepository();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController retypepasswordController =
      TextEditingController();

  ProgressDialog pd;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    retypepasswordController.dispose();
    super.dispose();
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
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 29,
              right: ScreenUtil.getInstance().setWidth(100),
              left: ScreenUtil.getInstance().setWidth(100),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 80,
              right: ScreenUtil.getInstance().setWidth(140),
              left: ScreenUtil.getInstance().setWidth(140),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: ScreenUtil.getInstance().setHeight(135),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFF386B4F),
                            offset: Offset(0.0, 25.0),
                            blurRadius: 5)
                      ]),
                ),
              ),
            ),
            Container(
              width: ScreenUtil.mediaQueryData.size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(60),
                  ),
                  Logo(),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    height: ScreenUtil.mediaQueryData.size.height * 0.68,
                    width: ScreenUtil.mediaQueryData.size.width * 0.8,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [accentColor, accentColor],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15, top: 10),
                          child: Text(
                            "Register",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            controller: firstNameController,
                            decoration: InputDecoration(
                              isDense: true,
                              border: InputBorder.none,
                              hintText: "First Name",
                              filled: true,
                              fillColor: Color(0xFF5F6273),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            controller: lastNameController,
                            decoration: InputDecoration(
                              isDense: true,
                              border: InputBorder.none,
                              hintText: "Last Name",
                              filled: true,
                              fillColor: Color(0xFF5F6273),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              isDense: true,
                              border: InputBorder.none,
                              hintText: "Username",
                              filled: true,
                              fillColor: Color(0xFF5F6273),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              isDense: true,
                              border: InputBorder.none,
                              hintText: "Email Address",
                              filled: true,
                              fillColor: Color(0xFF5F6273),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              isDense: true,
                              border: InputBorder.none,
                              hintText: "Password",
                              filled: true,
                              fillColor: Color(0xFF5F6273),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            controller: retypepasswordController,
                            decoration: InputDecoration(
                              isDense: true,
                              border: InputBorder.none,
                              hintText: "Re-type Password",
                              filled: true,
                              fillColor: Color(0xFF5F6273),
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                        Expanded(child: Container()),
                        MaterialButton(
                          onPressed: () async {
                            await _onRegisterPressed();
                          },
                          color: LSHBlackColor,
                          child: Text("REGISTER"),
                          minWidth: double.infinity,
                          height: 50,
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(20),
                        ),
                        InkWell(
                          onTap: () => forgotPasswordScreen(),
                          child: Row(
                            children: <Widget>[Text("Forgot Password?")],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onRegisterPressed() async {
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String rpassword = retypepasswordController.text;
//    String role = DEFAULT_USER_ROLE;

    if (firstName.isEmpty) {
      showToast(ERR_EMAIL_REQUIRED);
      return;
    }
    if (lastName.isEmpty) {
      showToast(ERR_EMAIL_REQUIRED);
      return;
    }

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

    if (rpassword.isEmpty) {
      showToast(ERR_RETYPE_PASSWORD_REQUIRED);
      return;
    }

    if (password != rpassword) {
      showToast(ERR_PASSWORD_MATCH_REQUIRED);
      return;
    }

    User user = User();
    user.firstName = firstName;
    user.lastName = lastName;
    user.email = email;
    user.password = password;
    //user.role = role;

    pd = NavigatorHelper(_scaffoldKey.currentState.context)
        .createProgressDialog(message: TEXT_LOADING);
//    print("${user.password}");
    pd.show();
    var response = await _repository.register(user);

    showToast(response.toJson().toString());

    if (response.statusCode == 200) {
      if (response.statusCode != 200) {
        //user already exists, save the email address and take him to the mainscreen
        pd.hide();
        showToast(response.message);
      } else {
        pd.hide(); //user does not exist, send him an otp and take him to the otp page for verification of account
//        await _repository.setLogin(true);
//        await _repository.setName('$firstName $lastName');
//        await _repository.setEmail(email);
        showToastSuccess("Your Registration was successful, Login to continue");
        loginScreen();
      }
    } else {
      pd.hide();
      showToast(response.formattedErrMessage);
    }
  }

  void reflectionScreen() {
    NavigatorHelper(_scaffoldKey.currentState.context)
        .showTopScreenPage(LandingPage.routeName, null);
  }

  void forgotPasswordScreen() {
    NavigatorHelper(_scaffoldKey.currentState.context)
        .showScreen(ForgetPasswordPage.routeName, null);
  }

  void loginScreen() {
    NavigatorHelper(_scaffoldKey.currentState.context)
        .showScreen(LoginPage.routeName, null);
  }

  showToast(String message) {
    NavigatorHelper(_scaffoldKey.currentState.context)
        .showToast(_scaffoldKey, message);
  }

  void showToastSuccess(String message) {
    Toast.show(message, _scaffoldKey.currentState.context,
        duration: Toast.LENGTH_LONG,
        gravity: Toast.CENTER,
        backgroundColor: Colors.green);
  }

  bool isEmailValid(String email) => RegExp(REG_EXP_EMAIL).hasMatch(email);
}
