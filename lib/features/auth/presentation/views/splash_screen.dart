import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_paddings.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/core/helper/my_navigator.dart';
import 'let_start_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((v){
      MyNavigator.goTo(context,topage: const LetsStartScreen());
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppSvgs.logo,
                width: double.infinity,
                height: 344.h
              ),
              SizedBox(height: 44.h),
              Text(
                'ToDo',
                style: TextStyle(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w300,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}