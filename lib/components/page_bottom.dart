import 'package:awsome_weather_app/models/weather_forecast.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';

class PageBottom extends StatelessWidget {
  final WeatherForecast current;
  PageBottom(this.current);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      margin: EdgeInsets.only(
          top: mediaQuery.size.height * 0.7,
          left: mediaQuery.size.width * 0.005,
          right: mediaQuery.size.width * 0.005),
      height: mediaQuery.size.height * 0.297,
      child: Card(
          color: Color.fromRGBO(0, 0, 0, 0.25),
          borderOnForeground: true,
          elevation: 15,
          shadowColor: Color.fromRGBO(33, 36, 43, 0),
          child: CarouselSlider(
            options: CarouselOptions(height: 400.0),
            items: current.daily.map((i) {
              var icon = i.weather.map((e) => e.icon).first;
              String iconPath =
                  "https://openweathermap.org/img/wn/$icon@2x.png";
              String description =
                  i.weather.map((e) => e.description).first.toString();
              int time = i.dt;
              var d = (DateTime.fromMillisecondsSinceEpoch(time * 1000,
                  isUtc: true));

              var newd = DateFormat("dd MMM y").format(d);

              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      padding: EdgeInsets.all(5),
                      child: Card(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        shadowColor: Color.fromRGBO(33, 36, 43, 0),
                        child: Column(
                          children: [
                            Image.network(
                              iconPath,
                            ),
                            Text(
                              newd.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'ElMessiri',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            Text(
                              description,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Play',
                                fontSize: 20,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Temperature: ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Play',
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  current.current.temp.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Play',
                                    fontSize: 15,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ));
                },
              );
            }).toList(),
          )),
    );
  }
}
