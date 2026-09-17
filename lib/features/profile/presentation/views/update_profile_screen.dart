import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/components/custom_button.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_paddings.dart';
import 'package:flutter_application_1/features/profile/data/repo/profile_repo.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final TextEditingController usernameController = TextEditingController();
  bool isLoading = false;

  void updateProfile() async {
    final username = usernameController.text.trim();
    final accessToken = '';

    if (username.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a username")),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    Profilerepo repo = Profilerepo();
    var result = await repo.updateProfile(
      username: username,
      accessToken: accessToken,
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
          const SnackBar(content: Text("Profile updated successfully ✅")),
        );
        Navigator.pop(context); 
      },
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F5F4),
      
      
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20.sp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      extendBodyBehindAppBar: true,

      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/GettyImages-1315607788 3.png',
              width: 375.w,
              height: 293.h,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 30.h),
            
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: usernameController,
                enabled: true,
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Username',
                  hintStyle: TextStyle(
                    color: const Color(0xff6E6A7C),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w200,
                  ),
                  labelText: 'Username',
                  labelStyle: TextStyle(
                    color: const Color(0xff6E6A7C),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w200,
                  ),
                  fillColor: const Color(0xffFFFFFF),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: const BorderSide(color: Color(0xffCDCDCD)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: const BorderSide(color: Color(0xff149954)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.h),

            
            SizedBox(
              height: 48.01.h,
              width: 335.w,
              child: CustomButton(
                text: isLoading ? "Saving..." : "Save",
                onpressed: () {
                  if (!isLoading) updateProfile();
                },
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}