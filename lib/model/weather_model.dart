class WeatherModel {
  final String cityName;
  final String main;
  final String country;
  final String icon;
  final String description;
  final double temperature;
  final double feelsLike;
  final double humidity;
  final double visibility;
  final double windSpeed;
  final int sunrise;
  final int sunset;

  WeatherModel({
    required this.cityName,
    required this.main,
    required this.country,
    required this.icon,
    required this.description,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.visibility,
    required this.windSpeed,
    required this.sunrise,
    required this.sunset,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      main: json['weather'][0]['main'],
      country: json['sys']['country'],
      icon:
          'http://openweathermap.org/img/wn/${json['weather'][0]['icon']}.png',
      description: json['weather'][0]['description'],
      temperature: (json['main']['temp'] as num).toDouble(),
      feelsLike: (json['main']['feels_like'] as num).toDouble(),
      humidity: (json['main']['humidity'] as num).toDouble(),
      visibility: (json['visibility'] as num).toDouble(),
      windSpeed: (json['wind']['speed'] as num).toDouble(),
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
    );
  }
}
