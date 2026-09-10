import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class UpdateProfile extends StatelessWidget{
  const UpdateProfile({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xffF3F5F4),
      body:Column(
        children:[
          Image.asset('assets/images/GettyImages-1315607788 3.png',
          width:375.w,
          height:293.h,
          fit: BoxFit.cover
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              enabled: true,
              decoration:InputDecoration(
                filled: true,
                hintText: 'Username',
                hintStyle: TextStyle(color: const Color(0xff6E6A7C),
                  fontSize: 14,
                  fontWeight: 
                  FontWeight.w200), 
                labelText:'Username',
                labelStyle: TextStyle(color: const Color(0xff6E6A7C),
                  fontSize: 14,
                  fontWeight: 
                  FontWeight.w200), 
                fillColor: const Color(0xffFFFFFF),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: const Color(0xffCDCDCD))
                )
              )
            )
          )


        ]
      )
    );
  }


}

