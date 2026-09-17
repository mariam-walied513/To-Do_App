import 'package:dio/dio.dart';

import '../models/weather_model.dart';

class WeatherService {
  final Dio dio = Dio();

  static const String baseUrl =
      'https://api.openweathermap.org/data/2.5/weather';

  static const String apiKey =
      '39ef56aa87e0f9d833e66cd9111de959';

  static const double latitude = 30.5877893;
  static const double longitude = 31.4798788;

  Future<WeatherModel> getWeather() async {
    try {
      final response = await dio.get(
        baseUrl,
        queryParameters: {
          'lat': latitude,
          'lon': longitude,
          'appid': apiKey,
        },
      );

      if (response.statusCode == 200) {
        return WeatherModel.fromJson(
          response.data,
        );
      } else {
        throw Exception(
          'Failed to load weather data',
        );
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final data = e.response!.data;

        if (data is Map &&
            data['message'] != null) {
          throw Exception(
            data['message'].toString(),
          );
        }
      }

      throw Exception(
        'Unable to connect to weather service',
      );
    } catch (e) {
      throw Exception(
        'Something went wrong',
      );
    }
  }
}
