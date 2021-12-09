import 'package:bloc/bloc.dart';
import 'package:functional_geekle/api/weather_api.dart';
import 'package:functional_geekle/bloc/weather_state.dart';
import 'package:functional_geekle/service/weather_service_3_3.dart' as s;

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.api) : super(InitialWeatherState());

  final WeatherApi api;

  Future<void> getWeather(String city) async {
    emit(LoadingWeatherState());
    final call = s.getWeather(city).run;
    final weather = await call(api);
    emit(weather.fold(
      (e) => ErrorWeatherState(e),
      (weather) => LoadedWeatherState(weather),
    ));
  }
}
