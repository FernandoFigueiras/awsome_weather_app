import 'package:awsome_weather_app/models/weather_by_day.dart';
import 'package:awsome_weather_app/models/weather_by_hour.dart';
import 'package:awsome_weather_app/models/weather_current_day.dart';
import 'package:awsome_weather_app/models/wether_by_minute.dart';

class WeatherForecast {
  dynamic lat;
  dynamic lon;
  String timezone;
  dynamic timezoneOffset;
  WeatherCurrentDay current;
  List<WeatherByMinute> minutely;
  List<WeatherByHour> hourly;
  List<WeatherByDay> daily;

  WeatherForecast(
      {this.lat,
      this.lon,
      this.timezone,
      this.timezoneOffset,
      this.current,
      this.minutely,
      this.hourly,
      this.daily});

  WeatherForecast.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
    timezone = json['timezone'];
    timezoneOffset = json['timezone_offset'];
    current = json['current'] != null
        ? new WeatherCurrentDay.fromJson(json['current'])
        : null;
    if (json['minutely'] != null) {
      minutely = [];
      json['minutely'].forEach((v) {
        minutely.add(new WeatherByMinute.fromJson(v));
      });
    }
    if (json['hourly'] != null) {
      hourly = [];
      json['hourly'].forEach((v) {
        hourly.add(new WeatherByHour.fromJson(v));
      });
    }
    if (json['daily'] != null) {
      daily = [];
      json['daily'].forEach((v) {
        daily.add(new WeatherByDay.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['timezone'] = this.timezone;
    data['timezone_offset'] = this.timezoneOffset;
    if (this.current != null) {
      data['current'] = this.current.toJson();
    }
    if (this.minutely != null) {
      data['minutely'] = this.minutely.map((v) => v.toJson()).toList();
    }
    if (this.hourly != null) {
      data['hourly'] = this.hourly.map((v) => v.toJson()).toList();
    }
    if (this.daily != null) {
      data['daily'] = this.daily.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
