import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/helper/my_navigator.dart';
import 'package:flutter_application_2/core/utils/app_assets.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/features/home/presentation/views/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_application_2/features/home/data/repo/home_repo.dart';




class SearchMapScreen extends StatefulWidget {
  const SearchMapScreen({super.key});

  @override
  State<SearchMapScreen> createState() => _SearchMapScreenState();
}

class _SearchMapScreenState extends State<SearchMapScreen> {
  GoogleMapController? _mapController;
  Position? _currentPosition;

  bool _isLoading = true;
  
  
  final SearchRepo _homeRepo = SearchRepo();
  String? _weatherDescription;
  double? _temp;
  bool _isLoadingWeather = false;

  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(30.0444, 31.2357),
    zoom: 14,
  );

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future<void> _fetchWeather(double lat, double lon) async {
    setState(() => _isLoadingWeather = true);

   
    final result = await _homeRepo.getWeather(
      Lat: 30.5877893,
      Log: 30.5877893
     );
    result.fold(
      (error) {
        if (mounted) setState(() => _isLoadingWeather = false);
      },
      (weatherData) {
        if (mounted) {
          final data = weatherData as Map<String, dynamic>;
          setState(() {
            _isLoadingWeather = false;
            _temp = (data['main']['temp'] as num).toDouble();
            _weatherDescription = data['weather'][0]['description'] as String;
          });
        }
      },
    );
  }

  Future<void> _getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (mounted) setState(() => _isLoading = false);
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        if (mounted) setState(() => _isLoading = false);
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      if (mounted) setState(() => _isLoading = false);
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    if (mounted) {
      setState(() {
        _currentPosition = position;
        _isLoading = false;
      });
     
      _fetchWeather(position.latitude, position.longitude);
    }

    _mapController?.animateCamera(
      CameraUpdate.newLatLngZoom(
        LatLng(position.latitude, position.longitude),
        16,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _initialCameraPosition,
             
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            markers: {
              if (_currentPosition != null)
                Marker(
                  markerId: const MarkerId('current_Loaction'),
                  position: LatLng(
                    _currentPosition!.latitude,
                    _currentPosition!.longitude,
                  ),
                ),
            },
            onMapCreated: (controller) {
              _mapController = controller;
              if (_currentPosition != null) {
                _mapController?.animateCamera(
                  CameraUpdate.newLatLngZoom(
                    LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
                    16,
                  ),
                );
              }
            },
            
            onTap: (LatLng position) {
              _fetchWeather(position.latitude, position.longitude);
            },
          ),

          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(color: Color(0xFF4C7EFF)),
            ),

          
          Positioned(
            top: 50.h,
            left: 20.w,
            right: 20.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors. black.withValues(alpha: 0.08),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppSvgs.profile,
                    width: 24.sp,
                    height: 24.sp,
                  
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    'Mariam Walied',
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                  const Spacer(),
                 
                  if (_isLoadingWeather)
                    SizedBox(
                      width: 16.w,
                      height: 16.h,
                      child: const CircularProgressIndicator(strokeWidth: 2),
                    )
                  else if (_temp != null)
                    Row(
                      children: [
                        Icon(Icons.wb_sunny_rounded, color: Colors.orange, size: 18.sp),
                        SizedBox(width: 4.w),
                        Text(
                          '${_temp!.toStringAsFixed(1)}°C',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF4C7EFF),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 40.h,
            left: 20.w,
            child: SizedBox(
              height: 48.h,
              child: ElevatedButton(
                onPressed: () {
                  MyNavigator.goTo(
                    context,
                    topage: const HomeScreen(),
                     type: NavigatorType.pushReplacement,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkBlue,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(128.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}