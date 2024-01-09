
import 'package:bloc/bloc.dart';
import 'package:weather_application_bloc/models/weather_model.dart';
import 'package:weather_application_bloc/repo/weather_repo.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final Weather_repo weatherRepository;

  WeatherBloc(this.weatherRepository) : super(WeatherInitial()){
    on<GetWeather>(getWeather);
  }

  void getWeather(GetWeather event, Emitter<WeatherState> emit) async{
        emit(WeatherLoading());

        try {
        final weatherData = await weatherRepository.fetchWeather(event.cityName);
        emit (WeatherLoaded(weatherData));
      } catch (e) {
        emit (WeatherError('Failed to fetch weather data'));
      }

  }
}