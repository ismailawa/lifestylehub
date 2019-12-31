import 'package:flutter/material.dart';
import 'package:life_style_hub/routes/generated_routes.dart';
import 'package:life_style_hub/values/values.dart';

void main() => runApp(LifeStyleApp());

class LifeStyleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      darkTheme: ThemeData(
        backgroundColor: backgroundColor,
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoutes,
    );
  }
}
