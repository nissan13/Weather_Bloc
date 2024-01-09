import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:weather_application_bloc/constant/constant.dart';
import 'package:weather_application_bloc/models/weather_model.dart';

class WeatherRepo {
  WeatherRepo(String apiKey);

  Future<WeatherModel> fetchWeather(String cityName) async {
     try {
      var apiUrl = Uri.parse('http://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=$apiKey');

      var response = await http.get(apiUrl);
      log(response.body.toString());

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        return WeatherModel.fromMap(data);
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}