import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application_bloc/bloc/weather_bloc.dart';
import 'package:weather_application_bloc/pages/weather_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              child: TextField(
                autofocus: true,
                controller: _cityController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        BlocProvider.of<WeatherBloc>(context)
                            .add(GetWeather(_cityController.text));
                      },
                      icon: const Icon(Icons.search)),
                  labelText: 'Enter city name',
                ),
              ),
            ),
            // const SizedBox(height: 20),
            // ElevatedButton(
            //     // icon: Icon(Icons.search),
            //     onPressed: () {
            //       BlocProvider.of<WeatherBloc>(context)
            //           .add(GetWeather(_cityController.text));
            //     },
            //     child: Text("Search")),
            Container(
              constraints: const BoxConstraints(maxWidth: 3000.0),
              child: Image.asset('logoo.gif'),
            ),
            const SizedBox(height: 20),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherLoading) {
                  return const CircularProgressIndicator();
                } else if (state is WeatherLoaded) {
                  return WeatherPage(state.weather, _cityController.text);
                  // Column(
                  //   children: [
                  //     Text(state.weather.city),
                  //     Text("${state.weather.temp}°C"),
                  //     Text(state.weather.desc.toUpperCase()),
                  //   ],
                  // );
                } else if (state is WeatherError) {
                  return Text('Error: ${state.message}');
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
