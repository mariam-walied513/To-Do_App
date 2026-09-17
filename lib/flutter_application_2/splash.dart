 import 'package:flutter/material.dart';
 import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:flutter_svg/flutter_svg.dart';

 class SplashScreen extends StatelessWidget{
   const SplashScreen({super.key});
   @override
   Widget build(BuildContext context){
     return Scaffold(
      
      appBar: AppBar(
        backgroundColor:const Color(0xffE9EEFA),
        leading: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "9:41",
                style: TextStyle(
                  fontSize:
                )
              )

           ),
           
      ) 
       );
   }
 }