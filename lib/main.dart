import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application_bloc/bloc/weather_bloc.dart';
import 'package:weather_application_bloc/constant/constant.dart';
import 'package:weather_application_bloc/pages/home_page.dart';
import 'package:weather_application_bloc/repo/weather_repo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
final Weather_repo weatherRepository = Weather_repo(apiKey);
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => WeatherBloc(weatherRepository),
        child: const HomePage(),
      ),
    );
  }
}
