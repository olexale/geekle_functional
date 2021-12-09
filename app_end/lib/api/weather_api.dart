import 'dart:math';

import 'package:functional_geekle/model/weather.dart';

final _rnd = Random();

class WeatherApi {
  Future<Weather> getWeather(String city) async {
    await Future.delayed(const Duration(milliseconds: 500));

    if (_rnd.nextDouble() < 0.2) {
      throw Exception('Something went wrong');
    }

    await Future.delayed(const Duration(milliseconds: 500));

    return Weather(city, _rnd.nextDouble() * 20 - 10);
  }
}
