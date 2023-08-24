import 'package:dio/dio.dart';
import 'package:dogs_app/model/dog_data.dart';
import 'package:dogs_app/model/images_data.dart';

class ApiService {
  Future<DogData> fetchDogData() async {
    final dio = Dio();
    final response = await dio.get(
        'https://dog.ceo/api/breeds/list/all'); // Replace with the actual URL

    if (response.statusCode == 200) {
      return DogData.fromJson(response.data);
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<ImagesModel> getBreedImage(String name) async {
    final dio = Dio();
    final response = await dio.get(
        'https://dog.ceo/api/breed/$name/images'); // Replace with the actual URL
    if (response.statusCode == 200) {
      return ImagesModel.fromJson(response.data);

      // return imagesModel.message;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
