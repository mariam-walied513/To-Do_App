import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Language extends StatelessWidget{
  const Language({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      leading: Padding(
        padding:
        const EdgeInsets.all(8),
        child: SvgPicture.asset('assets/images/Arrow - Up 2 - Iconly Pro (1).svg',
        width:21.w,
        height:21.h
      
        ),


      ),
      title: Text('Settings',
      style: TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w300,
        color: const Color(0xff24252C)
      ),
      textAlign: TextAlign.center,
      )
      ),
      
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Language',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: const Color(0xff24252C)
                )
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('AR',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xff24252C),
                      backgroundColor: const Color(0xffD9D9D9)
                    )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  const Text('EN',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xffFFFFFF),
                      backgroundColor: const Color(0xff149954),
                    )
                  ),
                  
                ])

            ])
        ])
     ] ),
    
      ),
    );
  }
   
    
}