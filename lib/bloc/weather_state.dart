part of 'weather_bloc.dart';

abstract class WeatherState {}
  
class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherModel weather;

  WeatherLoaded(this.weather);

  get weatherData => null;
}

class WeatherError extends WeatherState {
  final String message;

  WeatherError(this.message);
}
