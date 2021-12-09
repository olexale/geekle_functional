import 'package:functional_geekle/api/weather_api.dart';
import 'package:functional_geekle/model/weather.dart';
import 'package:functional_geekle/model/weather_service_error.dart';

final _validCharacters = RegExp(r'^[a-zA-Z]+$');

class WeatherService {
  const WeatherService(this.api);

  final WeatherApi api;

  Future<Weather> getWeather(String city) async {
    if (city.isEmpty) {
      // what do I need to do here? I don't know
      // let's throw an exception and hope that someone will handle it
      throw CityIsBlankWeatherServiceError();
    }

    if (!_validCharacters.hasMatch(city)) {
      // and again.
      throw NonValidSymbolsWeatherServiceError();
    }
    try {
      final weather = await api.getWeather(city);
      return weather;
    } catch (e) {
      // and again.
      throw SomethingWentWrongWeatherServiceError();
    }
  }
}
