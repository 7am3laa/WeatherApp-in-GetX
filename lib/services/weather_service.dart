// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://api.openweathermap.org/data/2.5/weather?';
  final String _apiKey = '979e237b0f5e09e3c71616ac4781af58';

  Future<WeatherModel> getWeather(String cityName) async {
    try {
      final response = await _dio.get(
        _baseUrl,
        queryParameters: {
          'q': cityName,
          'appid': _apiKey,
          'units': 'metric',
        },
      );

      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load weather');
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        throw Exception('City not found');
      } else {
        throw Exception('Failed to load weather');
      }
    }
  }
}
