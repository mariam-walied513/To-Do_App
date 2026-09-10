import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LetsStart extends StatelessWidget {
  const LetsStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color(0xffF3F5F4),
      appBar: AppBar(
        backgroundColor:const Color(0xffF3F5F4),
      ),
     

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/OBJECTS012.svg',
              width: 301.7.w,
              height: 342.86.h,
            ),
            SizedBox(height: 20.h),
            Text(
              "Welcome To\n Do It!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: const Color(0xff24252C),
              ),
            ),
            SizedBox(height: 20.0.h),
            Text(
              "Ready to conquer your tasks? Let's Do\nIt together.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: const Color(0xff6E6A7C),
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 48.01.h,
              width: 331.w,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff149954),
                   elevation:20.0,
                    shadowColor: const Color(0xff149954),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                    
                  ),
                ),
                child: Text(
                  "Let\'s Start",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xffFFFFFF),
                  ),
                ),
              ),
              
            ),
            SizedBox(height:150.h)
          ],
        ),
      ),
    );
  }
}