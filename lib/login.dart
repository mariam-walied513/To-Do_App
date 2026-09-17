import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatelessWidget{
  const Login({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xffF3F5F4),
      body: 
       Column(
        children: [
          Switch(value: true, onChanged: (bool newValue){}),
          Image.asset('assets/images/GettyImages-1315607788 3.png',
          width: 375.w,
          height: 293.h,
          fit: BoxFit.cover,
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20),
            child:
          TextFormField(
            enabled: true,
              decoration: InputDecoration(
                filled: true,
                hintText: 'Username',
                hintStyle: TextStyle(color: const Color(0xff6E6A7C),
                  fontSize: 14,
                  fontWeight: 
                  FontWeight.w200), 
                fillColor:  const Color(0xffFFFFFF),
                enabledBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: const Color(0xffCDCDCD))
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SvgPicture.asset('assets/images/Profile - Iconly Pro.svg',
                  width:24.w,
                  height:24.h
                  )
                  )
              )
              )
          ),
            SizedBox(height: 20.h),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal:20),
            child:
           TextFormField(
            enabled: true,
           
              decoration: InputDecoration(
                filled: true,
                hintText: 'Password',
                hintStyle: TextStyle(color: const Color(0xff6E6A7C),
                  fontSize: 14,
                  fontWeight: 
                  FontWeight.w200), 
                fillColor:  const Color(0xffFFFFFF),
                enabledBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: const Color(0xffCDCDCD))
                ),
                suffixIcon:Padding(
                  padding: const EdgeInsets.all(16.0),
                   child: SvgPicture.asset('assets/images/Unlock - Iconly Pro.svg',
                    width:24.w,
                    height:24.h
                   ) 
                   ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SvgPicture.asset('assets/images/Password - Iconly Pro (1).svg',
                  width:24.w,
                  height:24.h
                  ),
                 
                )
                
                  )

              )
          ),
           SizedBox(height: 20.h),
           
          
             const Spacer(),
            SizedBox(
              height: 48.01.h,
              width: 331.w,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff149954),
                   elevation:20.0,
                    shadowColor: const Color(0xff149954),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                    
                  ),
                ),
            child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xffFFFFFF),
                  ),
                ),
              ),
            ),
            SizedBox(height:10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't Have An Account? ",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w100,
                  color: const Color.fromARGB(255, 56, 47, 47)),
                ),
                 TextButton(
                  onPressed: () {},
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,),
                  ),
                )

              ]
              
              ),
              
             SizedBox(height:250.h),
        ],
    ),
    );
    
  }
 
}