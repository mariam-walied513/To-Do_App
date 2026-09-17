import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_paddings.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/core/helper/my_navigator.dart';
import 'package:flutter_application_1/core/components/custom_svg.dart';
import 'package:flutter_application_1/core/components/custom_button.dart';
import 'login_screen.dart';


class LetsStart extends StatelessWidget {
  const LetsStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor:AppColors.background,
      appBar: AppBar(
        backgroundColor:AppColors.background,
      ),
     

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
                AppSvgs.onBoarding,
              width: double.infinity,
              height: 342.h,
            ),
            SizedBox(height: 20.h),
            Text(
              "Welcome To\n Do It!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
              ),
            ),
           CustomButton(
             text: "Let's Start",
             onpressed: (){
              MyNavigator.goTo(context,topage: LoginScreen());
             }
           ),
            SizedBox(height:50.h)
          ],
        ),
      ),
    );
  }
}