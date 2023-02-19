import 'package:bloc/bloc.dart';

import '../../models/weather_model.dart';
import '../network/remote/weather_service.dart';
import 'states.dart';

class AppCubit extends Cubit<AppStates> {
  WeatherService weatherService;
  AppCubit(this.weatherService) : super(AppInitialState());

  String? cityName;
  WeatherModel? weatherModel;
  void getWeather({required String cityName}) async {
    emit(AppLoadingState());
    try {
      weatherModel = await weatherService.getWeather(cityName: cityName);
      emit(AppSuccessState(weatherModel: weatherModel!));
    } on Exception catch (error) {
      emit(AppFailureState());
    }
  }
}
