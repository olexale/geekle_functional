import 'package:bloc/bloc.dart';
import 'package:functional_geekle/bloc/weather_state.dart';
import 'package:functional_geekle/service/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.service) : super(InitialWeatherState());

  final WeatherService service;

  Future<void> getWeather(String city) async {
    emit(LoadingWeatherState());
    try {
      final weather = await service.getWeather(city);
      emit(LoadedWeatherState(weather));
    } catch (e) {
      emit(ErrorWeatherState(e.toString()));
    }
  }
}
