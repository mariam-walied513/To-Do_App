import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/app_assets.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/features/home/data/repo/home_repo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  double? _temp;
  String? _weatherCondition;
  bool _isLoadingWeather = true;

  final List<Map<String, String>> _popularItems = [
    {
      'title': 'The Pros and Cons of Remote Work',
      'category': 'Technology',
      'image': AppImages.man,
    },
    {
      'title': 'The Pros and Cons of Remote Work',
      'category': 'Technology',
      'image': AppImages.green,
    }
  ];

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
  }

  Future<void> _fetchWeatherData() async {
    final result = await SearchRepo().getWeather(Lat: 30.0444, Log: 31.2357);
    result.fold(
      (error) {
        if (mounted) setState(() => _isLoadingWeather = false);
      },
      (weatherData) {
        if (mounted) {
          setState(() {
            _isLoadingWeather = false;
            final weather = weatherData[0] as Map<String, dynamic>;
            _temp = ((weather['main'] as Map<String, dynamic>)['temp'] as num).toDouble();
            _weatherCondition = ((weather['weather'] as List<dynamic>)[0] as Map<String, dynamic>)['main'] as String;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: AppColors.lightBlue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.r),
                    bottomRight: Radius.circular(20.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Morning,',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          'Mariam Walied',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF180E29),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          'Sun 9 April, 2023',
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF7ED),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: _isLoadingWeather
                          ? SizedBox(
                              width: 14.w,
                              height: 14.h,
                              child: const CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Row(
                              children: [
                                Icon(
                                  _weatherCondition == 'Rain'
                                      ? Icons.grain_rounded
                                      : Icons.wb_sunny_rounded,
                                  color: Colors.orange,
                                  size: 18.sp,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  '${_temp?.toStringAsFixed(0) ?? '32'}°C',
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
              ),

            
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),

                 
                    Container(
                      height: 220.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        image: AssetImage(AppImages.japan) != null
                            ? DecorationImage(
                                image: AssetImage(AppImages.japan),
                                fit: BoxFit.cover,
                              )
                            : null,
                        color: Colors.grey[300],
                      ),
                      child: Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withValues(alpha: 0.75),
                            ],
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Experience the Serenity of\nJapan\'s Traditional Countryside',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.white,
                                      height: 1.3,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                                  decoration: BoxDecoration(
                                    color: AppColors.white.withValues(alpha: 0.3),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Text(
                                    'Luc Olinga',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 24.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Most Popular',
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF180E29),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'See More',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: AppColors.darkBlue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20.h),

                  
                    SizedBox(
                      height: 270.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _popularItems.length,
                        itemBuilder: (context, index) {
                          final item = _popularItems[index];
                          return Container(
                            width: 160.w,
                            margin: EdgeInsets.only(right: 14.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 130.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14.r),
                                    color: AppColors.darkGrey,
                                    image: DecorationImage(
                                      image: AssetImage(item['image']!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  item['title']!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.darkBlack,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  item['category']!,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.darkGrey,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

  
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color:AppColors.lightPink, 
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),  
            topRight: Radius.circular(24.r), 
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -4), 
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent, 
            elevation: 0,
            selectedItemColor: const Color(0xFF180E29),
            unselectedItemColor: Colors.grey[400],
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled, size: 24),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search, size: 24),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_outline, size: 24),
                label: 'Bookmark',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline, size: 24),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}