import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/presentation/views/splash_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/features/auth/presentation/views/login_screen.dart';
import 'package:flutter_application_1/features/auth/presentation/register_screen.dart';
import 'package:flutter_application_1/features/home/presentation/views/home_screen.dart';
import 'package:flutter_application_1/features/tasks/presentation/done_task_screen.dart';
import 'package:flutter_application_1/features/tasks/presentation/edit_screen.dart';
import 'package:flutter_application_1/features/profile/presentation/views/profile_screen.dart';
import 'package:flutter_application_1/features/profile/presentation/views/change_password_screen.dart';
import 'package:flutter_application_1/features/tasks/presentation/add_task_screen.dart';
import 'package:flutter_application_1/features/profile/presentation/views/setting_screen.dart';
import 'package:flutter_application_1/features/profile/presentation/views/update_profile_screen.dart';
import 'package:flutter_application_1/features/profile/presentation/views/change_password_screen.dart';
import 'package:flutter_application_1/features/profile/presentation/views/setting_screen.dart';
import 'package:flutter_application_1/features/tasks/presentation/edit_screen.dart';


void main(){
  runApp(const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return ScreenUtilInit(
      designSize: Size(375,812),
      builder:(_,child) => MaterialApp(
        debugShowCheckedModeBanner: false,
       theme: ThemeData(
          fontFamily: 'Lexend_Deca'
        ),
        home:SplashScreen ()
      )
    );
  }
}