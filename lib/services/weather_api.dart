import 'dart:convert' as convert;
import 'package:awsome_weather_app/models/weather_forecast.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  static Future<dynamic> getWeatherForecast(double lat, double long) async {
    WeatherForecast current = new WeatherForecast();

    String url =
        "https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$long&units=metric&appid=4be650ead52b27615d975c49726f16aa";

    var response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception("Unable to load weather forecast");
    }

    current = WeatherForecast.fromJson(convert.jsonDecode(response.body));

    return current;
  }
}
