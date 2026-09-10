import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profile extends StatelessWidget{
  const Profile ({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xffF3F5F4),
      appBar: AppBar(
        backgroundColor:const Color(0xffF3F5F4),
        leading: Padding(
          padding: const EdgeInsets.all(8) ,
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/GettyImages-1315607788 3.png'
            ),
             radius: 60.0
            
          ),

          
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello!",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: const Color(0xff24252C)
                )
              ),
              Text(
                "Ahmed Saber",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: const Color(0xff24252C)
                )

              ),
              

            ],
          

            ),
            


      ),
      body: Column(
        children:[
           SizedBox(height: 20.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20),
            child:TextFormField(
            enabled: true,
              decoration: InputDecoration(
                filled: true,
                hintText: 'Profile',
                fillColor:  const Color(0xffFFFFFF),
                enabledBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: const Color(0xffCDCDCD))
                ),
                suffixIcon:Padding(
                  padding: const EdgeInsets.all(16.0),
                   child: SvgPicture.asset('assets/images/Arrow - Up 2 - Iconly Pro.svg',
                    width:24.w,
                    height:24.h
                   ) 
                   ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SvgPicture.asset('assets/images/Profile - Iconly Pro.svg',
                  width:24.w,
                  height:24.h
                  )
                  )

              )
          ),
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
                fillColor:  const Color(0xffFFFFFF),
                enabledBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: const Color(0xffCDCDCD))
                ),
                suffixIcon:Padding(
                  padding: const EdgeInsets.all(16.0),
                   child: SvgPicture.asset('assets/images/Arrow - Up 2 - Iconly Pro.svg',
                    width:24.w,
                    height:24.h
                   ) 
                   ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SvgPicture.asset('assets/images/Unlock - Iconly Pro.svg',
                  width:24.w,
                  height:24.h
                  ),
                 
                  
                
                  )

              )
          ),
             ),
           SizedBox(height: 20.h),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal:20),
            child:
           TextFormField(
            enabled: true,
           
              decoration: InputDecoration(
                filled: true,
                hintText: 'settings ',
                fillColor:  const Color(0xffFFFFFF),
                enabledBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: const Color(0xffCDCDCD))
                ),
                suffixIcon:Padding(
                  padding: const EdgeInsets.all(16.0),
                   child: SvgPicture.asset('assets/images/Arrow - Up 2 - Iconly Pro.svg',
                    width:24.w,
                    height:24.h
                   ) 
                   ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SvgPicture.asset('assets/images/Setting - Iconly Pro.svg',
                  width:24.w,
                  height:24.h
                  ),
                 
                  
                
                  )

              )
          ),
            ),
            
          
         
        ]
      )
    );
  }

}