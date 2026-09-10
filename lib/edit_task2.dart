import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditTask2 extends StatelessWidget {
  const EditTask2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F5F4),
      appBar: AppBar(
        backgroundColor: const Color(0xffF3F5F4),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: SvgPicture.asset('assets/images/Arrow - Up 2 - Iconly Pro (1).svg'),
        ),
        title: Text(
          'Edit Task',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w300,
            color: const Color(0xff24252C),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: BoxDecoration(
                color: const Color(0xffE4312B),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  SvgPicture.asset('assets/images/Vector (2).svg'),
                  const SizedBox(width: 4),
                  Text(
                    'Delete',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xffFFFFFF),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/GettyImages-1315607788 3.png',

                  ),
                  radius: 50,
                ),
                const SizedBox(width: 4),
                const Text(
                  "In Progress\nBelieve you can, and you're halfway\nthere.",
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                enabled: true,
                decoration: InputDecoration(
                      suffixIconConstraints: const BoxConstraints(
                    minWidth: 10,
                    minHeight: 10,
                  ),
                  filled: true,
                  hintText: 'Home',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xff6E6A7C),
                  ),
                  labelText: 'Home',
                  labelStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                    color: const Color(0xff6E6A7C),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SvgPicture.asset('assets/images/Group 1000002824.svg'),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SvgPicture.asset('assets/images/Vector.svg'),
                  ),
                  fillColor: const Color(0xffFFFFFF),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: const Color(0xffCDCDCD)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                enabled: true,
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Grocery Shopping App',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xff24252C),
                  ),
                  fillColor: const Color(0xffFFFFFF),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: const Color(0xffCDCDCD)),
                  ),
                  labelText: 'Grocery Shopping App',
                  labelStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                    color: const Color(0xff6E6A7C),
                  ),
                
                ),
              ),
            ),
             SizedBox(height: 20.h),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                enabled: true,
                 maxLines: 4,
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Go for grocery to buy some products. Go for\n grocery to buy some products. Go for grocery to buy some products.\n Go for grocery to buy some products.',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xff24252C),
                  ),
                  fillColor: const Color(0xffFFFFFF),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: const Color(0xffCDCDCD)),
                  ),
                  labelText: 'Grocery Shopping App',
                  labelStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                    color: const Color(0xff6E6A7C),
                  ),
                
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                enabled: true,
                decoration: InputDecoration(
                  filled: true,
                  hintText: '30 June, 2022    10:00 pm',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xff24252C),
                  ),
                  fillColor: const Color(0xffFFFFFF),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: const Color(0xffCDCDCD)),
                  ),
                  labelText: 'End Time',
                  labelStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                    color: const Color(0xff6E6A7C),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SvgPicture.asset(
                      'assets/images/calendar.svg',
                      width: 24.w,
                      height: 24.h,
                    ),
                  ),
                ),
              ),
          
            ),
          ],
          
          
        ),
      ),
    );
  }
}
