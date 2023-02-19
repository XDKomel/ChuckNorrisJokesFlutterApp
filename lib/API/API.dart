import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:flutter_application_1/API/joke_model.dart';

class API {
  static final Dio dio = Dio();

  static Future<JokeModel?> upload() async {
    try {
      final response = await dio.get('https://api.chucknorris.io/jokes/random');
      final model = JokeModel.fromJson(response.data);
      return model;
    } on DioError catch (e) {
      developer.log("Something went wrong: $e");
    }
    return null;
  }
}
