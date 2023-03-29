import 'package:flutter/material.dart';

import '../../../domain/entity/photo.dart';

class SinglePhotoViewModel extends ChangeNotifier {
  Photo photo;

  SinglePhotoViewModel(this.photo) {
    notifyListeners();
  }

  void goBack(BuildContext context) {
    if (Navigator.of(context).canPop()){
      Navigator.of(context).pop();
    }
  }
}