import 'package:flutter/material.dart';
import 'package:front_end/routes.dart';
import 'package:front_end/theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
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
