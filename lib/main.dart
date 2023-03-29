import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:photosapp/ui/navigation/navigation.dart';

void main() async {
  runApp(const MyApp());
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
}

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PhotoApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: mainNavigation.routes,
      initialRoute: MainNavigationRouteNames.homeScreen,
      onGenerateRoute: mainNavigation.onGenerateRoute,
    );
  }
}