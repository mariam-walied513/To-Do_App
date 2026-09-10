import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatelessWidget{
  const Home({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
          backgroundColor: const Color(0xffF3F5F4),
      appBar: AppBar(
        backgroundColor:const Color(0xffF3F5F4),
        leading: Padding(
          padding: const EdgeInsets.all(8) ,
          child: CircleAvatar(
            backgroundImage:AssetImage('assets/images/GettyImages-1315607788 3.png'),
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
     floatingActionButton: FloatingActionButton(
       onPressed: () {},
       backgroundColor: const Color(0xff149954),
       shape:RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(14)

       ),
       child: SvgPicture.asset('assets/images/Paper Plus - Iconly Pro.svg',
       width:24.w,
       height:24.h

     ),
     




    ),
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 182,vertical:60 ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "There are no tasks yet,\nPress the button \nTo add New Task ",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: const Color(0xff24252C)
            )
                
          ),
          SizedBox(height: 20.h),
           SvgPicture.asset('assets/images/55024598_9264826 1.svg',
           width:375.w,
           height:268.h,
           fit: BoxFit.contain
           )

        ],)
      )
    );
  }
}