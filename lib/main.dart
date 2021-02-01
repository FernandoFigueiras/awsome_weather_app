import 'dart:async';

import 'package:awsome_weather_app/components/body_page.dart';
import 'package:awsome_weather_app/models/weather_forecast.dart';
import 'package:awsome_weather_app/services/location.dart';
import 'package:awsome_weather_app/services/weather_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  _getPosition() async {
    Position position = await Location.getPosition();
    if (position != null) {
      return _getCurrentWeather(position.latitude, position.longitude);
    }

    return null;
  }

  _getCurrentWeather(double lat, double lon) async {
    WeatherForecast current = new WeatherForecast();

    current = await WeatherApi.getWeatherForecast(lat, lon);

    return current;
  }

  @override
  Widget build(BuildContext context) {
    Future<dynamic> currentWeather = _getPosition();
    return Scaffold(
      body: FutureBuilder<dynamic>(
          future: currentWeather,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return BodyPage(snapshot.data);
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
