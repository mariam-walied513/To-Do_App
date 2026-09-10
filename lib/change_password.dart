import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ChangePassword extends StatelessWidget{
  const ChangePassword({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color (0xffF3F5F4),
      body: Column(
        children: [
          Image.asset('assets/images/GettyImages-1315607788 3.png',
          width: 375.w,
          height: 293.h,
          fit: BoxFit.cover
          
          ),
          SizedBox(height: 20.h),
          Padding(
            padding:const EdgeInsets.symmetric(horizontal:20),
            child: TextFormField(
              enabled: true,
              decoration:InputDecoration(
                filled:true,
                hintText:'Old Password',
                hintStyle: TextStyle(color: const Color(0xff6E6A7C),
                  fontSize: 14,
                  fontWeight: FontWeight.w200

                ),
                labelText:'Old Password',
                labelStyle: TextStyle(color: const Color(0xff6E6A7C),
                  fontSize: 14,
                  fontWeight: 
                  FontWeight.w200), 
                fillColor:const Color(0xffFFFFFF),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: const Color(0xffCDCDCD))
                  )
              )
            )

          ),
           SizedBox(height: 20.h),
          Padding(
            padding:const EdgeInsets.symmetric(horizontal:20),
            child: TextFormField(
              enabled: true,
              decoration:InputDecoration(
                filled:true,
                hintText:'New Password',
                hintStyle: TextStyle(color: const Color(0xff6E6A7C),
                  fontSize: 14,
                  fontWeight: FontWeight.w200

                ),
                labelText:'New  Password',
                labelStyle: TextStyle(color: const Color(0xff6E6A7C),
                  fontSize: 14,
                  fontWeight: 
                  FontWeight.w200), 
                fillColor:const Color(0xffFFFFFF),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: const Color(0xffCDCDCD))
                  )
              )
            )

          ),
           SizedBox(height: 20.h),
          Padding(
            padding:const EdgeInsets.symmetric(horizontal:20),
            child: TextFormField(
              enabled: true,
              decoration:InputDecoration(
                filled:true,
                hintText:'Confirm Password',
                hintStyle: TextStyle(color: const Color(0xff6E6A7C),
                  fontSize: 14,
                  fontWeight: FontWeight.w200

                ),
                labelText:'Confirm Password',
                labelStyle: TextStyle(color: const Color(0xff6E6A7C),
                  fontSize: 14,
                  fontWeight: 
                  FontWeight.w200), 
                fillColor:const Color(0xffFFFFFF),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: const Color(0xffCDCDCD))
                              )
              )
            ),
          
 
          ),
          const Spacer(),
          SizedBox(
            height: 48.01.h,
            width: 331.w,
            child:
            ElevatedButton(
              onPressed:(){},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff149954),
                elevation:20.0,
                shadowColor: const Color(0xff149954),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),

              ),
              child: Text(
                'Save',
                style: TextStyle(
                  fontSize:19,
                  fontWeight: FontWeight.w300,
                  color: const Color(0xffFFFFFF),
                 )
              )
             )),
             SizedBox(height:250.h),
             

        ],)

    );
  }
}