import 'package:flutter/material.dart';

import '../models/weather_model.dart';
import '../services/weather_service.dart';
import '../widgets/app_bottom_nav.dart';
import 'bookmark_screen.dart';
import 'explore_screen.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherService weatherService = WeatherService();

  WeatherModel? weather;

  bool isLoading = true;

  String? errorMessage;

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  Future<void> getWeather() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final WeatherModel result = await weatherService.getWeather();

      if (!mounted) return;

      setState(() {
        weather = result;
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        isLoading = false;
        errorMessage = e.toString().replaceFirst('Exception: ', '');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(child: _buildBody()),
            _buildBottomNavigation(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 85,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      color: const Color(0xFFE9EDF9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Good Morning,',
                style: TextStyle(
                  fontFamily: 'Georgia',
                  fontSize: 14,
                  color: Color(0xFF777777),
                ),
              ),
              Text(
                'Ahmed Saber',
                style: TextStyle(
                  fontFamily: 'Georgia',
                  fontSize: 14,
                  color: Color(0xFF777777),
                ),
              ),
              SizedBox(height: 3),
              Text(
                'Sun 9 April, 2023',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF222222),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/sun.png',
                width: 34,
                height: 34,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 7),
              Text(
                weather == null
                    ? 'Sunny 32°C'
                    : '${weather!.weatherMain} ${weather!.temperatureText}°C',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF777777),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: Color(0xFF315FD4),
        ),
      );
    }

    if (errorMessage != null) {
      return _buildError();
    }

    if (weather == null) {
      return const Center(
        child: Text(
          'No weather data',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 27),

            Text(
              '${weather!.cityName} - ${weather!.country}',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Color(0xFF222222),
              ),
            ),

            const SizedBox(height: 7),

            Row(
              children: [
                Text(
                  weather!.temperatureText,
                  style: const TextStyle(
                    fontSize: 46,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF222222),
                  ),
                ),
                const Spacer(),
                Image.asset(
                  'assets/images/sun.png',
                  width: 78,
                  height: 78,
                  fit: BoxFit.contain,
                ),
              ],
            ),

            const SizedBox(height: 10),

            Text(
              '${weather!.weatherMain} - ${weather!.descriptionText}',
              style: const TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.w500,
                color: Color(0xFF222222),
              ),
            ),

            const SizedBox(height: 3),

            Text(
              'Feels like ${weather!.feelsLikeText}',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Color(0xFF777777),
              ),
            ),

            const SizedBox(height: 58),

            Row(
              children: [
                Expanded(
                  child: WeatherInfo(
                    image: 'assets/images/Fahrenheit.png',
                    value: '${weather!.fahrenheitText}°',
                    label: 'Fahrenheit',
                  ),
                ),
                Expanded(
                  child: WeatherInfo(
                    image: 'assets/images/Pressure.png',
                    value: '${weather!.pressureText} hPa',
                    label: 'Pressure',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            Row(
              children: [
                Expanded(
                  child: WeatherInfo(
                    image: 'assets/images/UV Index.png',
                    value: '0.2',
                    label: 'UV Index',
                  ),
                ),
                Expanded(
                  child: WeatherInfo(
                    image: 'assets/images/Humidity.png',
                    value: '${weather!.humidityText}%',
                    label: 'Humidity',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 70),

            Center(
              child: SizedBox(
                width: 223,
                height: 52,
                child: ElevatedButton(
                  onPressed: getWeather,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF315FD4),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Change Location',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 7),
                      Icon(
                        Icons.location_on,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildError() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.cloud_off,
              size: 60,
              color: Color(0xFF315FD4),
            ),
            const SizedBox(height: 15),
            Text(
              errorMessage ?? 'Something went wrong',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF777777),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: getWeather,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF315FD4),
                foregroundColor: Colors.white,
              ),
              child: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return AppBottomNav(
      selectedIndex: 3,
      onItemTapped: (index) {
        // Explore → فتح شاشة Explore
        if (index == 1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const ExploreScreen(),
            ),
          );
          return;
        }

        // Bookmark → فتح شاشة البوك مارك
        if (index == 2) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const BookmarkScreen(),
            ),
          );
          return;
        }

        if (index == 3) return;
      },
    );
  }
}

class WeatherInfo extends StatelessWidget {
  final String image;
  final String value;
  final String label;

  const WeatherInfo({
    Key? key,
    required this.image,
    required this.value,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          image,
          width: 38,
          height: 38,
          fit: BoxFit.contain,
        ),
        const SizedBox(width: 17),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF2459D1),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFFA0A0A8),
              ),
            ),
          ],
        ),
      ],
    );
  }
}