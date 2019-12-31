import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:life_style_hub/values/values.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: 150,
          width: 150,
           decoration: BoxDecoration(
             image: DecorationImage(image: AssetImage("assets/images/hub.png",),fit: BoxFit.fill)
           ),
        ),
      ),
    );
  }
}
