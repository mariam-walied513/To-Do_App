import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'custom_svg.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';


class CustomTextField extends StatelessWidget{
  const CustomTextField({super.key, required this.hint, this.prefixIconpath,
   this.suffixIconpath, this.onSuffixPressed,required this.controller,
   this.obscureText=false
  });
  final String hint;
  final String ?prefixIconpath;
  final String?suffixIconpath;
  final void Function() ?onSuffixPressed;
  final TextEditingController controller;
  final bool obscureText;
  @override
  Widget build(BuildContext context){
    return TextFormField(
      controller: controller,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w300,
        color:AppColors.black
       ),
        obscureText: obscureText,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          prefixIcon: prefixIconpath != null
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SvgPicture.asset(prefixIconpath!),
                )
              : null,
          suffixIcon: suffixIconpath != null
              ? IconButton(
                  onPressed: onSuffixPressed,
                  icon: SvgPicture.asset(suffixIconpath!),
                )
              : null,
           hintText: hint,
           hintStyle: TextStyle(
             fontSize: 14.sp,
             color: AppColors.grey
           ),
           fillColor:Colors.white,
           filled:true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(
                color: AppColors.lightGrey,
              ),
             ),

          
        )
    );
  }
   
  }

