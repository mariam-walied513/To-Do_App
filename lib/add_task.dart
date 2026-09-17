import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddTask extends StatelessWidget{
  const AddTask ({super.key});
  @override
  Widget build(BuildContext context){
     return Scaffold(
      backgroundColor: const Color(0xffF3F5F4),
      appBar:
      AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xffF3F5F4),
        leading: Padding(
          padding:
          const EdgeInsets.all(8),
          child: SvgPicture.asset('assets/images/Arrow - Up 2 - Iconly Pro (1).svg'
          // width:21.w,
          // height:21.h
           )
           
            
           ),
           title: Text(
            "Add Task",
            style: TextStyle(
              fontSize:19,
              fontWeight: FontWeight.w300,
              color: const Color(0xff24252C)
             )
           ),
      ),
       body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: 
            Image.asset('assets/images/GettyImages-1315607788 3.png',
             width:261.w,
             height:207.h,
             fit: 
             BoxFit.contain,
            ),
            ),
             SizedBox(height: 20.h),
             Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20),
              child:TextFormField(
                enabled: true,
                decoration: InputDecoration(
                  filled: true,
                  hintText:'Title',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                    color: const Color(0xff6E6A7C)
                  ),
                  fillColor: const Color(0xffFFFFFF),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: const Color(0xffCDCDCD))
                  ),
                  labelText:'Title',
                  labelStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                    color: const Color(0xff6E6A7C)
                 )
                 )
              )
               ),
                SizedBox(height: 20.h),
             Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20),
              child:TextFormField(
                enabled: true,
                decoration: InputDecoration(
                  filled: true,
                  hintText:'Description',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                    color: const Color(0xff6E6A7C)
                  ),
                  labelText:'Description',
                  labelStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                    color: const Color(0xff6E6A7C)
                 ),
                 fillColor: const Color(0xffFFFFFF),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: const Color(0xffCDCDCD))
                  ),
                 )
              )
               ),
               SizedBox(height: 20.h),
             Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20),
              child:TextFormField(
                enabled: true,
                decoration: InputDecoration(
                  filled: true,
                  hintText:'Group',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                    color: const Color(0xff6E6A7C)
                  ),
                  fillColor: const Color(0xffFFFFFF),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: const Color(0xffCDCDCD))
                  ),
                  labelText:'Group',
                  labelStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                    color: const Color(0xff6E6A7C)
                 ),
                  suffixIcon: Padding(
                    padding:
                     const EdgeInsets.all(16.0),
                     child: SvgPicture.asset('assets/images/Vector.svg',
                     
                     )
                 )
              )
               ),
             ),
               SizedBox(height: 20.h),
             Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20),
              child:TextFormField(
                enabled: true,
                decoration: InputDecoration(
                  filled: true,
                  hintText:'End Time',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                    color: const Color(0xff6E6A7C)
                  ),
                  fillColor: const Color(0xffFFFFFF),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: const Color(0xffCDCDCD))
                  ),
                  labelText:'End Time',
                  labelStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                    color: const Color(0xff6E6A7C)
                 ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SvgPicture.asset('assets/images/calendar.svg',
                      width:24.w,
                      height:24.h
                    )
                  )
                 )
              )
               ),
                const Spacer(),
                SizedBox(
                  width: 331.w,
                  height: 48.01.h,
                  child: ElevatedButton(
                    onPressed:(){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff149954),
                       elevation:20.0,
                        shadowColor: const Color(0xff149954),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                          
                        )
                    ),
                    child: Text(
                      "Add Task",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xffFFFFFF),
                      )
                    )
                  )
                ),
                SizedBox(height:200.h),
          ]
          )
        )
         
          );
        
    
  }
     
     
  }
