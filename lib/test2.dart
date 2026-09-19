import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/presentation/views/splash_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/splash.dart';
import 'package:flutter_application_1/start.dart';
import 'package:flutter_application_1/register.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/register2.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/home2.dart';
import 'package:flutter_application_1/profile.dart';
import 'package:flutter_application_1/update_profile.dart';
import 'package:flutter_application_1/change_password.dart';
import 'package:flutter_application_1/language.dart';
import 'package:flutter_application_1/add_task.dart' as add_task;
import 'package:flutter_application_1/add_task3.dart';
import 'package:flutter_application_1/add_task2.dart' as add_task2;
import 'package:flutter_application_1/edit_task.dart';
import 'package:flutter_application_1/edit_task2.dart';
import 'package:flutter_application_1/sec.dart';
import 'package:flutter_application_1/features/tasks/add_task_screen.dart' as add_task_screen;
import 'package:flutter_application_1/features/home/presentation/views/home_screen1.dart' as home_screen;
import 'package:flutter_application_1/features/profile/presentation/views/profile_screen.dart' as profile_screen;
import 'package:flutter_application_1/features/auth/presentation/views/splash_screen.dart' as splash_screen;


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
        home:splash_screen.SplashScreen ()
      )
    );
  }
}