class WeatherModel {
  final String temp;
  final String temp_min;
  final String temp_max;
  final String city;
  final String desc;
  final String icon;

  WeatherModel.fromMap(Map<String, dynamic> json)
      : temp = json['main']['temp'].toString(),
      temp_min = json['main']['temp_min'].toString(),
      temp_max = json['main']['temp_max'].toString(),
        city = json['name'],
        desc = json['weather'][0]['description'],
        icon = json['weather'][0]['icon'];
}

