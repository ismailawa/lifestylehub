import 'package:flutter/material.dart';
import 'package:life_style_hub/routes/generated_routes.dart';

void main() => runApp(LifeStyleApp());

class LifeStyleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      darkTheme: ThemeData(

      ),
      initialRoute: 'login',
      onGenerateRoute: RouteGenerator.generateRoutes,
    );
  }
}
