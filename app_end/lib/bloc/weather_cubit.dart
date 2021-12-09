import 'package:bloc/bloc.dart';
import 'package:functional_geekle/bloc/weather_state.dart';
import 'package:functional_geekle/service/weather_service_2.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.service) : super(InitialWeatherState());

  final WeatherService service;

  Future<void> getWeather(String city) async {
    emit(LoadingWeatherState());

    final weather = await service.getWeather(city);
    emit(weather.fold(
      (e) => ErrorWeatherState(e),
      (weather) => LoadedWeatherState(weather),
    ));
  }
}
