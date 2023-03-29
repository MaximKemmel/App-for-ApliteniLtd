import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:photosapp/ui/screens/home/home.dart';
import 'package:photosapp/ui/screens/home/home_viewmodel.dart';
import 'package:photosapp/ui/screens/single_photo/single_photo.dart';
import 'package:photosapp/ui/screens/single_photo/single_photo_viewmodel.dart';
import '../entity/photo.dart';

class ScreenFactory {
  Widget makeHomeScreen() {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: const HomeScreen(),
    );
  }

  Widget makeSinglePhotoScreen(Photo photo) {
    return ChangeNotifierProvider(
      create: (_) => SinglePhotoViewModel(photo),
      child: const SinglePhotoScreen(),
    );
  }
}