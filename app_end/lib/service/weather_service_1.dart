import 'package:f_lib/f_lib.dart';

import 'package:functional_geekle/api/weather_api.dart';
import 'package:functional_geekle/model/weather.dart';
import 'package:functional_geekle/model/weather_service_error.dart';

final _validCharacters = RegExp(r'^[a-zA-Z]+$');

class WeatherService {
  const WeatherService(this.api);

  final WeatherApi api;

  Future<Either<WeatherServiceError, Weather>> getWeather(String city) async {
    if (city.isEmpty) {
      return Left(CityIsBlankWeatherServiceError());
    }

    if (!_validCharacters.hasMatch(city)) {
      return Left(NonValidSymbolsWeatherServiceError(city));
    }
    try {
      final weather = await api.getWeather(city);
      return Right(weather);
    } catch (e) {
      return Left(SomethingWentWrongWeatherServiceError());
    }
  }
}
