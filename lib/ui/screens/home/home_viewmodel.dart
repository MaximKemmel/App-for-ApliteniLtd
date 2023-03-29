import 'package:flutter/material.dart';

import '../../../domain/entity/photo.dart';
import '../../../domain/services/api_service.dart';
import '../../navigation/navigation.dart';

class HomeViewModel extends ChangeNotifier {
  final ApiService apiService = ApiService();
  List<Photo> photos = [];

  HomeViewModel() {
    getPhotos();
  }

  void getPhotos() async {
    photos = await apiService.getPhotos();
    notifyListeners();
  }

  void showPhoto(BuildContext context, int index) {
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.singlePhotoScreen,
      arguments: photos[index],
    );
  }
}