import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/home/presentation/views/search_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/auth/presentation/views/splash_screen.dart';
import 'features/home/presentation/views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Lexend_Deca',
        ),
        home: SearchMapScreen(),
      ),
    );
  }
}
      