class WeatherByMinute {
  dynamic dt;
  dynamic precipitation;

  WeatherByMinute({this.dt, this.precipitation});

  WeatherByMinute.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    precipitation = json['precipitation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this.dt;
    data['precipitation'] = this.precipitation;
    return data;
  }
}
