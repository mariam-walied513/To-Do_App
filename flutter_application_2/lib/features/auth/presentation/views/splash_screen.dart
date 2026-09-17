import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/core/utils/app_paddings.dart';
import 'package:flutter_application_2/core/utils/app_assets.dart';
import 'package:flutter_application_2/core/helper/my_navigator.dart';
import 'welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((v) {
      MyNavigator.goTo(context, topage: const WelcomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue, 
      body: Center(
        child: RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 48.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.darkBlue
            ),
            children: [
              TextSpan(
                text: 'Khab'
              ),
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: SvgPicture.asset(AppSvgs.paper,
                    width: 60.w,
                    height: 55.h
                  )
                   )
              ),
              TextSpan(text: 'r')
            ]
          )
        )
      ),
    );
  }
}