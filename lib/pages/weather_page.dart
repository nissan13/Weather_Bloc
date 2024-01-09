import 'package:flutter/material.dart';
import 'package:weather_application_bloc/models/weather_model.dart';

class WeatherPage extends StatelessWidget {
  final WeatherModel weather;
  final String city;
  WeatherPage(this.weather, this.city);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 32, left: 32, top: 10),
      child: Column(
        children: [
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
            "${weather.desc}",
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
                      Text("${weather.temp_min}C",style: const TextStyle(color: Colors.white70, fontSize: 30),),
                      const Text("Min Temprature",style: TextStyle(color: Colors.white70, fontSize: 14),),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("${weather.temp_max}C",style: const TextStyle(color: Colors.white70, fontSize: 30),),
                      const Text("Max Temprature",style: TextStyle(color: Colors.white70, fontSize: 14),),
                    ],
                  ),
            ],
          )
        ],
      ),
    );
  }
}
