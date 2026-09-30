import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/data/repo/auth_repo.dart';
import 'package:flutter_application_1/features/auth/presentation/register_screen.dart';

// ⚠️ قم باستيراد شاشة الـ Home الخاصة بك هنا بدلاً من هذا المسار المفترض
import 'package:flutter_application_1/features/home/presentation/views/home_screen.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_paddings.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/core/helper/my_navigator.dart';
import 'package:flutter_application_1/core/components/custom_svg.dart';
import 'package:flutter_application_1/core/components/custom_button.dart';
import 'package:flutter_application_1/core/components/custom_text_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // مفتاح النموذج للتحقق من صحة المدخلات
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // متحكمات حقول النصوص
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // إنشاء كائن من الـ AuthRepo
  final AuthRepo _authRepo = AuthRepo();

  // حالات الشاشة المحلية
  bool _isLoading = false;
  bool _isObscure = true;

  // دالة التعامل مع تسجيل الدخول باستخدام AuthRepo
  Future<void> _handleLogin() async {
    // التحقق من صحة المدخلات في الحقول
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // تفعيل حالة التحميل
    setState(() {
      _isLoading = true;
    });

    // استدعاء دالة تسجيل الدخول من الـ AuthRepo
    final result = await _authRepo.login(
      username: _usernameController.text.trim(),
      password: _passwordController.text.trim(),
    );

    // إيقاف حالة التحميل
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }

    if (result.isLeft()) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              result.fold((error) => error, (_) => 'Login failed'),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
      return;
    }

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Login Successful! Welcome ${_usernameController.text.trim()}',
          ),
          backgroundColor: const Color(0xff149954),
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Home(), 
        ),
      );
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F5F4),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Switch(
                      value: true,
                      onChanged: (bool newValue) {},
                      activeColor: const Color(0xff149954),
                    ),
                  ),
                ),
                Image.asset(
                  AppImages.flag,
                  width: 375.w,
                  height: 293.h,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10.h),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _usernameController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Username',
                      hintStyle: const TextStyle(
                        color: Color(0xff6E6A7C),
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                      ),
                      fillColor: const Color(0xffFFFFFF),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Color(0xffCDCDCD)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Color(0xff149954)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SvgPicture.asset(
                          AppSvgs.profile,
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: _isObscure,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                        color: Color(0xff6E6A7C),
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                      ),
                      fillColor: const Color(0xffFFFFFF),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Color(0xffCDCDCD)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Color(0xff149954)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SvgPicture.asset(
                          AppSvgs.password,
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SvgPicture.asset(
                            AppSvgs.lockClosed,
                            width: 24.w,
                            height: 24.h,
                            colorFilter: _isObscure
                                ? null
                                : const ColorFilter.mode(
                                    Color(0xff149954), BlendMode.srcIn),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 35.h),

                SizedBox(
                  height: 48.01.h,
                  width: 331.w,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _handleLogin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff149954),
                      disabledBackgroundColor:
                          const Color(0xff149954).withOpacity(0.6),
                      elevation: 8.0,
                      shadowColor: const Color(0xff149954).withOpacity(0.4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: _isLoading
                        ? SizedBox(
                            width: 24.w,
                            height: 24.h,
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2.5,
                            ),
                          )
                        : const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFFFFFF),
                            ),
                          ),
                  ),
                ),
                SizedBox(height: 15.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't Have An Account? ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color.fromARGB(255, 56, 47, 47),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        MyNavigator.goTo(context, topage: const Register());
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}