import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/features/home/presentation/views/explore_screen.dart';
import 'package:flutter_application_2/features/home/presentation/views/search_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_2/core/utils/app_assets.dart';
import 'package:flutter_application_2/core/helper/my_navigator.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.darkBlue,
              AppColors.lightBlue
            ]
          )
        ),
      
      child: 
       Stack(
        children: [
         
          Positioned(
            top:-60.h,
            left:0,
            right:0,
            bottom: 180.h,
            child: Image.asset(
              AppImages.welcomeBg, 
              fit: BoxFit.cover,
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.r),
                  topRight: Radius.circular(32.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .5),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
            
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 
                  Text(
                    'Get The Latest News\nAnd Updates',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF180E29),
                      height: 1.2,
                    ),
                  ),
                  SizedBox(height: 12.h),

                  
                  Text(
                    'From Politics to Entertainment: Your One-\n Stop Source for Comprehensive Coverage \n of the Latest News and Developments\n Across the Globe will be right on your hand.',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 24.h),

                 
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        MyNavigator.goTo(context, topage: const SearchMapScreen());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.darkBlue,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.r),
                          
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Explore',
                            style: TextStyle(
                              fontSize:20.sp,
                              fontWeight: FontWeight.w600,
                              color:AppColors.white,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Icon(
                            Icons.arrow_forward_rounded,
                            size: 16.sp,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}