import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/custom_button.dart';
import 'package:flutter_application_1/core/components/custom_text_field.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_paddings.dart';
import 'package:flutter_application_1/features/profile/data/repo/profile_repo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePasswordScreen> {
 
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool isLoading = false;

 
  void changePassword() async {
    final oldPassword = oldPasswordController.text.trim();
    final newPassword = newPasswordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

   
    if (oldPassword.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    if (newPassword != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords do not match")),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

     Profilerepo repo = Profilerepo();
    final result = await (repo as dynamic).changePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );

    result.fold(
      (String error) {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error)),
        );
      },
      (success) {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Password changed successfully ✅")),
        );
        Navigator.pop(context); 
      },
    );
  }

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView( 
         child: Column(
          children: [
            Image.asset(
              AppImages.flag,
              width: 375.w,
              height: 293.h,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: AppPaddings.defaultPadding,
              child: CustomTextField(
                hint: "Old Password",
                prefixIconpath: null,
                controller: oldPasswordController,
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: AppPaddings.defaultPadding,
              child: CustomTextField(
                hint: "New Password",
                controller: newPasswordController,
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: AppPaddings.defaultPadding,
              child: CustomTextField(
                hint: "Confirm Password",
                controller: confirmPasswordController,
              ),
            ),
            SizedBox(height: 40.h),
            SizedBox(
              height: 48.01.h,
              width: 331.w,
              child: CustomButton(
                text: isLoading ? "Loading..." : "Save",
                onpressed: isLoading ? () {} : changePassword,
              ),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}