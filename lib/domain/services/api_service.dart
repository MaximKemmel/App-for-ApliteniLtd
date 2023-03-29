import 'dart:convert';
import 'package:http/http.dart' as http;

import '../entity/photo.dart';

class ApiService {
  final String apiToken = 'ab3411e4ac868c2646c0ed488dfd919ef612b04c264f3374c97fff98ed253dc9';

  Future<List<Photo>> getPhotos() async {
    List<Photo> photos = [];
    try {
      var response = await http.get(Uri.parse('https://api.unsplash.com/photos?page=1&per_page=50&client_id=$apiToken'));
      var jsonData = json.decode(response.body);
      for (var photoData in jsonData) {
        photos.add(Photo(
          smallUrl: photoData['urls']['small'],
          userName: photoData['user']['name'] ?? '',
          name: photoData['description'] ?? photoData['id'],
          id: photoData['id'],
          fullUrl: photoData['urls']['regular'],
        ));
      }
    } catch (exception) {
      //ToDo: логирование ошибок
    }

    return photos;
  }
}