class WeatherModel {
  final String cityName;
  final String country;

  final double temperature;
  final double feelsLike;

  final String weatherMain;
  final String weatherDescription;

  final double pressure;
  final int humidity;

  WeatherModel({
    required this.cityName,
    required this.country,
    required this.temperature,
    required this.feelsLike,
    required this.weatherMain,
    required this.weatherDescription,
    required this.pressure,
    required this.humidity,
  });

  factory WeatherModel.fromJson(
    Map<String, dynamic> json,
  ) {
    final main =
        json['main'] as Map<String, dynamic>;

    final weatherList =
        json['weather'] as List<dynamic>;

    final weather =
        weatherList.first as Map<String, dynamic>;

    final sys =
        json['sys'] as Map<String, dynamic>;

    return WeatherModel(
      cityName:
          json['name']?.toString() ?? 'Cairo',

      country:
          sys['country']?.toString() ?? 'EG',

      
      temperature:
          (main['temp'] as num).toDouble() -
              273.15,

      feelsLike:
          (main['feels_like'] as num).toDouble() -
              273.15,

      weatherMain:
          weather['main']?.toString() ?? 'Clear',

      weatherDescription:
          weather['description']?.toString() ??
              'Clear Sky',

      pressure:
          (main['pressure'] as num).toDouble(),

      humidity:
          (main['humidity'] as num).toInt(),
    );
  }

  double get fahrenheit {
    return (temperature * 9 / 5) + 32;
  }

  String get temperatureText {
    return temperature.round().toString();
  }

  String get feelsLikeText {
    return feelsLike.round().toString();
  }

  String get fahrenheitText {
    return fahrenheit.round().toString();
  }

  String get pressureText {
    return pressure.round().toString();
  }

  String get humidityText {
    return humidity.toString();
  }

  String get descriptionText {
    if (weatherDescription.isEmpty) {
      return 'Clear Sky';
    }

    return weatherDescription
        .split(' ')
        .map(
          (word) {
            if (word.isEmpty) {
              return word;
            }

            return word[0].toUpperCase() +
                word.substring(1);
          },
        )
        .join(' ');
  }
}
