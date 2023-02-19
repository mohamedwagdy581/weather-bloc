import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/modules/home_page.dart';
import 'package:weather_app/shared/cubit/cubit.dart';

import 'shared/network/remote/weather_service.dart';

void main() {
  runApp(BlocProvider(
      create: (context) {
        return AppCubit(WeatherService());
      },
      child: const WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: BlocProvider.of<AppCubit>(context).weatherModel == null
            ? Colors.blue
            : BlocProvider.of<AppCubit>(context).weatherModel!.getThemeColor(),
      ),
      home: HomePage(),
    );
  }
}
