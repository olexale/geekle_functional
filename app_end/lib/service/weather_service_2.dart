import 'package:f_lib/f_lib.dart';
// import 'package:fpdart/fpdart.dart';

import 'package:functional_geekle/api/weather_api.dart';
import 'package:functional_geekle/model/weather.dart';
import 'package:functional_geekle/model/weather_service_error.dart';

final _validCharacters = RegExp(r'^[a-zA-Z]+$');

// extension ObjectX on Object {
//   T pipe<T, T1>(T Function(T1) f) => f(this as T1);
// }

class WeatherService {
  const WeatherService(this.api);

  final WeatherApi api;

  Future<Either<WeatherServiceError, Weather>> getWeather(String city) => city
      .pipe(_isNotEmpty)
      .flatMap(_hasValidCharacters)
      .flatMapTask(_fetchWeather)
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

  TaskEither<WeatherServiceError, Weather> _fetchWeather(String city) =>
      TaskEither.tryCatch(
        () => api.getWeather(city),
        (_, __) => SomethingWentWrongWeatherServiceError(),
      );
}
