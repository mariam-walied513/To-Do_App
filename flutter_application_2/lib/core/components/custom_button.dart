import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,required this.text,required this.onpressed});
  final String text;
  final void Function() onpressed;
  @override
   Widget build(BuildContext context){
    return InkWell(
      onTap: onpressed,
      

    );
   }

}