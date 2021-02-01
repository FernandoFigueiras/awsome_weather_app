import 'package:awsome_weather_app/models/weather_forecast.dart';
import 'package:flutter/material.dart';

class PageTop extends StatelessWidget {
  final WeatherForecast current;

  PageTop(this.current);
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    var iconPath = current.current.weather.map((e) => e.icon).first;
    String weatherDescription =
        current.current.weather.map((e) => e.description.toString()).first;
    String imageFullPath = "https://openweathermap.org/img/wn/$iconPath@2x.png";
    return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          top: mediaQuery.size.height * 0.1,
          left: mediaQuery.size.height * 0.02,
          right: mediaQuery.size.height * 0.02,
        ),
        child: Column(
          children: [
            Column(
              children: [
                Text(
                  current.timezone,
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontFamily: 'ElMessiri',
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              child: Image.network(imageFullPath),
            ),
            // SizedBox(
            //   height: mediaQuery.size.height * 0.02,
            // ),
            Text(weatherDescription,
                style: TextStyle(
                    color: Colors.grey[700],
                    fontFamily: 'ElMessiri',
                    fontSize: 35)),
            SizedBox(
              height: mediaQuery.size.height * 0.02,
            ),
            Container(
              // margin: EdgeInsets.only(left: mediaQuery.size.height * 0.1),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Temperature: ",
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontFamily: 'Play',
                              fontSize: 25)),
                      Text(current.current.temp.toString() + " C",
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontFamily: 'Play',
                              fontSize: 25)),
                    ],
                  ),
                  SizedBox(
                    height: mediaQuery.size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Feels like: ",
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontFamily: 'Play',
                              fontSize: 25)),
                      Text(current.current.feelsLike.toString() + " C",
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontFamily: 'Play',
                              fontSize: 25)),
                    ],
                  ),
                  SizedBox(
                    height: mediaQuery.size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Humidity: ",
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontFamily: 'Play',
                              fontSize: 25)),
                      Text(current.current.humidity.toString() + " %",
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontFamily: 'Play',
                              fontSize: 25))
                    ],
                  ),
                  SizedBox(
                    height: mediaQuery.size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Wind Speed: ",
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontFamily: 'Play',
                              fontSize: 25)),
                      Text(current.current.windSpeed.toString() + " meter/sec",
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontFamily: 'Play',
                              fontSize: 25))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
