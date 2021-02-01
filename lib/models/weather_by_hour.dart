import 'package:awsome_weather_app/models/rain.dart';
import 'package:awsome_weather_app/models/weather.dart';

class WeatherByHour {
  dynamic dt;
  dynamic temp;
  dynamic feelsLike;
  dynamic pressure;
  dynamic humidity;
  dynamic dewPoint;
  dynamic uvi;
  dynamic clouds;
  dynamic visibility;
  dynamic windSpeed;
  dynamic windDeg;
  List<Weather> weather;
  dynamic pop;
  Rain rain;

  WeatherByHour(
      {this.dt,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.dewPoint,
      this.uvi,
      this.clouds,
      this.visibility,
      this.windSpeed,
      this.windDeg,
      this.weather,
      this.pop,
      this.rain});

  WeatherByHour.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    temp = json['temp'];
    feelsLike = json['feels_like'];
    pressure = json['pressure'];
    humidity = json['humidity'];
    dewPoint = json['dew_point'];
    uvi = json['uvi'];
    clouds = json['clouds'];
    visibility = json['visibility'];
    windSpeed = json['wind_speed'];
    windDeg = json['wind_deg'];
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather.add(new Weather.fromJson(v));
      });
    }
    pop = json['pop'];
    rain = json['rain'] != null ? new Rain.fromJson(json['rain']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this.dt;
    data['temp'] = this.temp;
    data['feels_like'] = this.feelsLike;
    data['pressure'] = this.pressure;
    data['humidity'] = this.humidity;
    data['dew_point'] = this.dewPoint;
    data['uvi'] = this.uvi;
    data['clouds'] = this.clouds;
    data['visibility'] = this.visibility;
    data['wind_speed'] = this.windSpeed;
    data['wind_deg'] = this.windDeg;
    if (this.weather != null) {
      data['weather'] = this.weather.map((v) => v.toJson()).toList();
    }
    data['pop'] = this.pop;
    if (this.rain != null) {
      data['rain'] = this.rain.toJson();
    }
    return data;
  }
}
