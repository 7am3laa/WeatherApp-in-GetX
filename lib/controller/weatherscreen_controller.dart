// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherScreenController extends GetxController {
  WeatherModel? weatherModel;
  final WeatherService _weatherService = WeatherService();
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> fetchWeather(String cityName) async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      WeatherModel weather = await _weatherService.getWeather(cityName);
      weatherModel = weather;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  dynamic getTime(time) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(time * 1000);
    // Format the date and time as needed
    // String formattedDate =
    //     "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
    String formattedTime =
        "${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}:${date.second.toString().padLeft(2, '0')}";
    return formattedTime;
  }

  bool isWeatherNull() {
    if (weatherModel != null) {
      return false;
    } else {
      return true;
    }
  }

  String getWeatherImage(state) {
    switch (state) {
      case 'Clouds':
        return 'assets/images/cloud.png';
      case 'Clear':
        return 'assets/images/wave.png';
      case 'Rain':
        return 'assets/images/rain.png';
      case 'Snow':
        return 'assets/images/hurricane.png';
      case 'Thunderstorm':
        return 'assets/images/thunderstorm.png';
      default:
        return 'assets/images/clouds.png';
    }
  }
}
