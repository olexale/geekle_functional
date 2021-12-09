import 'package:f_lib/f_lib.dart';

import 'package:functional_geekle/api/weather_api.dart';
import 'package:functional_geekle/model/weather.dart';
import 'package:functional_geekle/model/weather_service_error.dart';

final _validCharacters = RegExp(r'^[a-zA-Z]+$');

// Try 1
Future<Either<WeatherServiceError, Weather>> getWeather(
  String city,
  WeatherApi api,
) =>
    _isNotEmpty(city)
        .flatMap(_hasValidCharacters)
        .flatMapTask((a) => _fetchWeather(a, api))
        .run();

IOEither<WeatherServiceError, String> _isNotEmpty(String city) =>
    IOEither.fromPredicate(
      city,
      (a) => a.isNotEmpty,
      (_) => CityIsBlankWeatherServiceError(),
    );

IOEither<WeatherServiceError, String> _hasValidCharacters(String city) =>
    IOEither.fromPredicate(
      city,
      _validCharacters.hasMatch,
      (a) => NonValidSymbolsWeatherServiceError(a),
    );

TaskEither<WeatherServiceError, Weather> _fetchWeather(
  String city,
  WeatherApi api,
) =>
    TaskEither.tryCatch(
      () => api.getWeather(city),
      (_, __) => SomethingWentWrongWeatherServiceError(),
    );
