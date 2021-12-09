abstract class WeatherServiceError {
  const WeatherServiceError();

  T map<T>({
    required T Function(CityIsBlankWeatherServiceError value) cityIsBlank,
    required T Function(NonValidSymbolsWeatherServiceError value)
        nonValidSymbols,
    required T Function(SomethingWentWrongWeatherServiceError value)
        somethingWentWrong,
  });
}

class CityIsBlankWeatherServiceError extends WeatherServiceError {
  @override
  T map<T>(
      {required T Function(CityIsBlankWeatherServiceError value) cityIsBlank,
      required T Function(NonValidSymbolsWeatherServiceError value)
          nonValidSymbols,
      required T Function(SomethingWentWrongWeatherServiceError value)
          somethingWentWrong}) {
    return cityIsBlank(this);
  }
}

class NonValidSymbolsWeatherServiceError extends WeatherServiceError {
  const NonValidSymbolsWeatherServiceError(this.city);

  final String city;

  @override
  T map<T>(
      {required T Function(CityIsBlankWeatherServiceError value) cityIsBlank,
      required T Function(NonValidSymbolsWeatherServiceError value)
          nonValidSymbols,
      required T Function(SomethingWentWrongWeatherServiceError value)
          somethingWentWrong}) {
    return nonValidSymbols.call(this);
  }
}

class SomethingWentWrongWeatherServiceError extends WeatherServiceError {
  @override
  T map<T>(
      {required T Function(CityIsBlankWeatherServiceError value) cityIsBlank,
      required T Function(NonValidSymbolsWeatherServiceError value)
          nonValidSymbols,
      required T Function(SomethingWentWrongWeatherServiceError value)
          somethingWentWrong}) {
    return somethingWentWrong(this);
  }
}
