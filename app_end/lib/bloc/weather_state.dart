import 'package:functional_geekle/model/weather.dart';
import 'package:functional_geekle/model/weather_service_error.dart';

abstract class WeatherState {
  T map<T>({
    required T Function(InitialWeatherState) onInitial,
    required T Function(ErrorWeatherState) onError,
    required T Function(LoadedWeatherState) onLoaded,
    required T Function(LoadingWeatherState) onLoading,
  });
}

class InitialWeatherState extends WeatherState {
  @override
  T map<T>({
    required T Function(InitialWeatherState) onInitial,
    required T Function(ErrorWeatherState) onError,
    required T Function(LoadedWeatherState) onLoaded,
    required T Function(LoadingWeatherState) onLoading,
  }) {
    return onInitial(this);
  }
}

class ErrorWeatherState extends WeatherState {
  ErrorWeatherState(this.error);
  final WeatherServiceError error;

  @override
  T map<T>({
    required T Function(InitialWeatherState) onInitial,
    required T Function(ErrorWeatherState) onError,
    required T Function(LoadedWeatherState) onLoaded,
    required T Function(LoadingWeatherState) onLoading,
  }) {
    return onError(this);
  }
}

class LoadedWeatherState extends WeatherState {
  LoadedWeatherState(this.weather);
  final Weather weather;

  @override
  T map<T>({
    required T Function(InitialWeatherState) onInitial,
    required T Function(ErrorWeatherState) onError,
    required T Function(LoadedWeatherState) onLoaded,
    required T Function(LoadingWeatherState) onLoading,
  }) {
    return onLoaded(this);
  }
}

class LoadingWeatherState extends WeatherState {
  @override
  T map<T>({
    required T Function(InitialWeatherState) onInitial,
    required T Function(ErrorWeatherState) onError,
    required T Function(LoadedWeatherState) onLoaded,
    required T Function(LoadingWeatherState) onLoading,
  }) {
    return onLoading(this);
  }
}
