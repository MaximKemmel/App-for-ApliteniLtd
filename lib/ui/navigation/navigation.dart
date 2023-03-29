import 'package:flutter/material.dart';

import '../../domain/entity/photo.dart';
import '../../domain/factories/screen_factory.dart';

abstract class MainNavigationRouteNames {
  static const homeScreen = '/';
  static const singlePhotoScreen = '/photo';
}

class MainNavigation {
  static final ScreenFactory screenFactory = ScreenFactory();

  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.homeScreen: (_) => screenFactory.makeHomeScreen(),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.singlePhotoScreen:
        final arguments = settings.arguments;
        final photo = arguments is Photo ? arguments : Photo(
            smallUrl: '', userName: '', name: '', id: '', fullUrl: ''
        );
        return MaterialPageRoute(
          builder: (_) => screenFactory.makeSinglePhotoScreen(photo),
        );
      default:
        const widget = Text('Navigation error');
        return MaterialPageRoute(builder: (_) => widget);
    }
  }
}