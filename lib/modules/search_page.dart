import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/shared/cubit/cubit.dart';
import 'package:weather_app/shared/network/remote/weather_service.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  String? cityName;
  SearchPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;

              BlocProvider.of<AppCubit>(context)
                  .getWeather(cityName: cityName!);
              BlocProvider.of<AppCubit>(context).cityName = cityName;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              label: const Text('search'),
              suffixIcon: GestureDetector(
                  onTap: () async {
                    WeatherService service = WeatherService();

                    WeatherModel? weather =
                        await service.getWeather(cityName: cityName!);

                    Provider.of<WeatherProvider>(context, listen: false)
                        .weatherData = weather;
                    Provider.of<WeatherProvider>(context, listen: false)
                        .cityName = cityName;

                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.search)),
              border: const OutlineInputBorder(),
              hintText: 'Enter a city',
            ),
          ),
        ),
      ),
    );
  }
}
