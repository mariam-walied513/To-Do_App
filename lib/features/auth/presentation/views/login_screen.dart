import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_paddings.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/core/helper/my_navigator.dart';
import 'package:flutter_application_1/core/components/custom_svg.dart';
import 'package:flutter_application_1/core/components/custom_button.dart';
import 'package:flutter_application_1/core/components/custom_text_field.dart';
import 'package:flutter_application_1/features/home/presentation/views/home_screen.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool isPasswordSecure = true;

  Future<void> _login() async {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter username and password'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      await Future.delayed(const Duration(milliseconds: 500));

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Welcome $username',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: AppColors.primary,
        ),
      );

      MyNavigator.goTo(
        context,
        topage: const HomeScreen(),
        type: NavigatorType.pushAndRemoveUntil,
      );
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: 
       Column(
        children: [
          Switch(value: true, onChanged: (bool newValue){}),
           ClipRRect(
             borderRadius: BorderRadius.only(bottomRight: Radius.circular(20.r),
               bottomLeft: Radius.circular(20.r)
             ),
            child:
          Image.asset(AppImages.flag,
          width: double.infinity,
          height: 293.h,
          fit: BoxFit.cover,
          ),
           ),
          SizedBox(height: 10.h),
          Padding(
            padding:AppPaddings.defaultPadding,
            child:
          CustomTextField(
            hint: 'Username',
            prefixIconpath: AppSvgs.profile,
            controller: usernameController,
          ),
          ),
            SizedBox(height: 20.h),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal:20),
            child:
          CustomTextField(
            hint: 'Password',
            prefixIconpath: AppSvgs.password,
            controller: passwordController,
            suffixIconpath: isPasswordSecure?
            AppSvgs.lockClosed:
            AppSvgs.lockOpen,
            onSuffixPressed: (){
              setState(() {
                isPasswordSecure = !isPasswordSecure;
              });
            },
            obscureText: isPasswordSecure,
          )
          ),
           SizedBox(height: 20.h),
            if (!isLoading)
              CustomButton(
                text: "Login",
                onpressed: _login,
              ),
            if (isLoading) const CircularProgressIndicator(),
        ],
       ),
      ),
    
      
    );
  }
}

    
                       