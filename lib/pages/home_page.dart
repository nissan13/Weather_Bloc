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
        backgroundColor: Colors.grey.shade400,
        centerTitle: true,
        elevation: 0.0,
        title: const Text('Weather App'),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
              // Container(
              //   constraints: const BoxConstraints(maxWidth: 3000.0),
              //   child: Image.asset('logoo.gif'),
              // ),
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
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          constraints: const BoxConstraints(maxWidth: 3000.0),
                                        child: Image.asset('logoo.gif'),
                        ),
                        const SizedBox(height: 30,),
                        const Text("Welcome to the world of", style: TextStyle(fontSize: 30),),
                        const Text("WEATHER", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),)
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
