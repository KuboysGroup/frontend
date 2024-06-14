import 'package:flutter/material.dart';
import 'package:front_end/routes.dart';
import 'package:front_end/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: theme,
      title: 'Flutter Demo',
      routerConfig: Routes.getRoutes(),
    );
  }
}
