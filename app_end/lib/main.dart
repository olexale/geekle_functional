import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:functional_geekle/api/weather_api.dart';
import 'package:functional_geekle/bloc/weather_cubit.dart';
import 'package:functional_geekle/bloc/weather_state.dart';
import 'package:functional_geekle/service/weather_service_2.dart';
import 'package:functional_geekle/model/weather_service_error.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Demo',
      home: BlocProvider(
        create: (context) => WeatherCubit(WeatherService(WeatherApi())),
        child: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Global Summit 21 Vol 2')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              onSubmitted: (v) => context.read<WeatherCubit>().getWeather(v),
            ),
            Expanded(
              child: Center(
                child: BlocBuilder<WeatherCubit, WeatherState>(
                  builder: (context, state) {
                    final text = state.map(
                      onInitial: (_) => 'Start by typing your city name',
                      onError: (s) => processError(s.error),
                      onLoaded: (s) =>
                          'Currently it is ${s.weather.temp.toStringAsPrecision(2)} in ${s.weather.city}',
                      onLoading: (_) => 'Loading',
                    );
                    return Text(
                      text,
                      style: Theme.of(context).textTheme.headline5,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String processError(WeatherServiceError error) {
    return error.map(
      cityIsBlank: (_) => 'Please enter your city',
      nonValidSymbols: (_) => 'Symbols are non-valid',
      somethingWentWrong: (_) => 'Something went wrong',
    );
  }
}
