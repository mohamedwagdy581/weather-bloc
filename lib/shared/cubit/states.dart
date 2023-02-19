import 'package:weather_app/models/weather_model.dart';

abstract class AppStates {}

// App Initial State
class AppInitialState extends AppStates {}

// Weather Data States
class AppLoadingState extends AppStates {}

class AppSuccessState extends AppStates {
  WeatherModel weatherModel;
  AppSuccessState({required this.weatherModel});
}

class AppFailureState extends AppStates {}
