import 'package:flutter/material.dart';
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
import 'package:flutter_application_1/add_task.dart';
import 'package:flutter_application_1/add_task3.dart';
import 'package:flutter_application_1/add_task2.dart';
import 'package:flutter_application_1/edit_task.dart';
import 'package:flutter_application_1/edit_task2.dart';

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
        home: SplashScreen()
       
       
   
      )
    );
  }
}