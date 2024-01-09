import 'package:flutter/material.dart';
import 'package:weather_application_bloc/models/weather_model.dart';

class WeatherPage extends StatelessWidget {
  final WeatherModel weather;
  final String city;
  WeatherPage(this.weather, this.city);

    String getWeatherImage() {
    switch (weather.condition.toLowerCase()) {
      
      case 'clear':
        return 'sun.gif';
      case 'clouds':
        return 'cloud.png';
      case 'rain':
        return 'rain.gif';
        case 'thunderstorm':
        return 'thunderstorm.png';
        case 'snow':
        return 'snowflake.png';
        case 'drizzle':
        return 'drizzle.png';
      default:
        return 'fog.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 32, left: 32, top: 10),
      child: Column(
        children: [
          Image.asset(getWeatherImage(), width:1000, height: 300),
          Text(
            city.toUpperCase(),
            style: const TextStyle(
                color: Colors.white70,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "${weather.temp}°C",
            style: const TextStyle(color: Colors.white70, fontSize: 50),
          ),
          // const Text(
          //   "Temprature",
          //   style: TextStyle(color: Colors.white70, fontSize: 14),
          // ),
          Text(
            "${weather.desc}".toUpperCase(),
            style: const TextStyle(color: Colors.white70, fontSize: 20),
          ),
          // const Text(
          //   "Description",
          //   style: TextStyle(color: Colors.white70, fontSize: 14),
          // ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                    children: <Widget>[
                      Text("${weather.temp_min}°C",style: const TextStyle(color: Colors.white70, fontSize: 30),),
                      const Text("Min Temperature",style: TextStyle(color: Colors.white70, fontSize: 14),),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("${weather.temp_max}°C",style: const TextStyle(color: Colors.white70, fontSize: 30),),
                      const Text("Max Temperature",style: TextStyle(color: Colors.white70, fontSize: 14),),
                    ],
                  ),
            ],
          )
        ],
      ),
    );
  }
}

