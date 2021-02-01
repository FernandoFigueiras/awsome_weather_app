import 'package:awsome_weather_app/components/page_bottom.dart';
import 'package:awsome_weather_app/components/page_top.dart';
import 'package:awsome_weather_app/models/weather_forecast.dart';
import '../components/gradient_background.dart';
import 'package:flutter/material.dart';

import 'gradient_background.dart';

class BodyPage extends StatelessWidget {
  final WeatherForecast current;
  BodyPage(this.current);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GradientBackground(),
        PageTop(current),
        PageBottom(current),
      ],
    );
  }
}
