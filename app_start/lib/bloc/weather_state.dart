import 'package:functional_geekle/model/weather.dart';

abstract class WeatherState {}

class InitialWeatherState extends WeatherState {}

class ErrorWeatherState extends WeatherState {
  ErrorWeatherState(this.error);
  final String error;
}

class LoadedWeatherState extends WeatherState {
  LoadedWeatherState(this.weather);
  final Weather weather;
}

class LoadingWeatherState extends WeatherState {}
