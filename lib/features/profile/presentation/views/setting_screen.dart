import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreen();
}

class _SettingScreen extends State<SettingScreen> {

  String selectedLanguage = 'EN';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context); 
          },
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              'assets/images/Arrow - Up 2 - Iconly Pro (1).svg',
              width: 21.w,
              height: 21.h,
            ),
          ),
        ),
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: 19.sp,
            fontWeight: FontWeight.w300,
            color: const Color(0xff24252C),
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Language',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xff24252C),
                  ),
                ),
          
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffD9D9D9),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    children: [
                     
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedLanguage = 'AR';
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: selectedLanguage == 'AR'
                                ? const Color(0xff149954)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            'AR',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: selectedLanguage == 'AR'
                                  ? const Color(0xffFFFFFF)
                                  : const Color(0xff24252C),
                            ),
                          ),
                        ),
                      ),
                  
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedLanguage = 'EN';
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: selectedLanguage == 'EN'
                                ? const Color(0xff149954)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            'EN',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: selectedLanguage == 'EN'
                                  ? const Color(0xffFFFFFF)
                                  : const Color(0xff24252C),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}