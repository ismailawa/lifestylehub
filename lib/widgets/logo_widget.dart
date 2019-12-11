import 'package:flutter/material.dart';
import 'package:life_style_hub/theme/colors.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Container(
        height: 110,
        width: 110,
        decoration: BoxDecoration(color: logoBg, shape: BoxShape.circle),
        child: Center(
            child: Text(
              "LOGO",
              style: TextStyle(fontSize: 30),
            )),
      ),
    );
  }
}