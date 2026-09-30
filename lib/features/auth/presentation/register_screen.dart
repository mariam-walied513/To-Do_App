import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/features/auth/data/repo/auth_repo.dart';
import 'package:flutter_application_1/features/auth/presentation/views/login_screen.dart';
import 'package:flutter_application_1/features/home/presentation/views/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final AuthRepo _authRepo = AuthRepo();

  bool _isLoading = false;
  bool _isPasswordObscure = true;
  bool _isConfirmPasswordObscure = true;

  Future<void> _handleRegister() async {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final result = await _authRepo.register(
      username: _usernameController.text.trim(),
      password: _passwordController.text.trim(),
    );

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }

    result.fold(
      (errorMessage) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      (successMessage) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(successMessage),
              backgroundColor: const Color(0xff149954),
            ),
          );
          
          
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
            (route) => false,
          );
          
        }
      },
    );
  }

  void _navigateToLogin() {
    FocusScope.of(context).unfocus();
    
   
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
   

    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                Image.asset(
                  AppImages.flag,
                  width: 375.w,
                  height: 293.h,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20.h),

                // Username Field
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
                    decoration: _buildInputDecoration(
                      hintText: 'Username',
                      prefixSvg: AppSvgs.profile,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),

                // Password Field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: _isPasswordObscure,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    decoration: _buildInputDecoration(
                      hintText: 'Password',
                      prefixSvg: AppSvgs.password,
                      suffixWidget: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isPasswordObscure = !_isPasswordObscure;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SvgPicture.asset(
                            AppSvgs.lockClosed,
                            width: 24.w,
                            height: 24.h,
                            colorFilter: _isPasswordObscure
                                ? null
                                : const ColorFilter.mode(
                                    Color(0xff149954), BlendMode.srcIn),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: _isConfirmPasswordObscure,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    decoration: _buildInputDecoration(
                      hintText: 'Confirm Password',
                      prefixSvg: AppSvgs.password,
                      suffixWidget: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isConfirmPasswordObscure = !_isConfirmPasswordObscure;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SvgPicture.asset(
                            AppSvgs.lockOpen,
                            width: 24.w,
                            height: 24.h,
                            colorFilter: _isConfirmPasswordObscure
                                ? null
                                : const ColorFilter.mode(
                                    Color(0xff149954), BlendMode.srcIn),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.h),

                // Register Button
                SizedBox(
                  height: 48.01.h,
                  width: 331.w,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _handleRegister,
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
                            "Register",
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w300,
                              color: Color(0xffFFFFFF),
                            ),
                          ),
                  ),
                ),
                SizedBox(height: 10.h),

                // Login Link Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already Have An Account? ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w100,
                        color: Color.fromARGB(255, 56, 47, 47),
                      ),
                    ),
                    TextButton(
                      onPressed: _navigateToLogin,
                      child: const Text(
                        "Login",
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

  InputDecoration _buildInputDecoration({
    required String hintText,
    required String prefixSvg,
    Widget? suffixWidget,
  }) {
    return InputDecoration(
      filled: true,
      hintText: hintText,
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
          prefixSvg,
          width: 24.w,
          height: 24.h,
        ),
      ),
      suffixIcon: suffixWidget,
    );
  }
}