import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/custom_button.dart';
import 'package:flutter_application_1/core/components/custom_text_field.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_paddings.dart';
import 'package:flutter_application_1/features/profile/data/repo/profile_repo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'update_profile_screen.dart';
import 'change_password_screen.dart';
import 'setting_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLoading = false;
  String? errorMsg;
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    getProfileData();
  }

  getProfileData() async {
    setState(() {
      errorMsg = null;
      isLoading = true;
      userData = null;
    });

    Profilerepo profilerepo = Profilerepo();
    var result = await profilerepo.getUser();
    
    result.fold(
      (String e) {
        setState(() {
          errorMsg = e;
          isLoading = false;
        });
      },
      (data) {
        setState(() {
          userData = userData; 
          isLoading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController profileController = TextEditingController();
    final TextEditingController changePasswordController = TextEditingController();
    final TextEditingController settingsController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: CircleAvatar(
            backgroundImage: AssetImage(AppImages.flag),
            radius: 60.0,
          ),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello!",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
                color: AppColors.black,
              ),
            ),
            Text(
              userData?['username'] ?? 'User',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w300,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMsg != null
              ? Center(child: Text(errorMsg!))
              : Column(
                  children: [
                    SizedBox(height: 20.h),

                    // 1. خيار Profile
                    Padding(
                      padding: AppPaddings.defaultPadding,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const UpdateProfile(),
                            ),
                          );
                        },
                        
                          child: CustomTextField(
                            hint: "Profile",
                            prefixIconpath: AppSvgs.profile,
                            controller: profileController,
                            suffixIconpath: AppSvgs.arrow_down,
                          ),
                        
                      ),
                    ),
                    SizedBox(height: 20.h),

                    
                    Padding(
                      padding: AppPaddings.defaultPadding,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChangePasswordScreen(),
                            ),
                          );
                        },
                        child: AbsorbPointer(
                          child: CustomTextField(
                            hint: "Change Password",
                            prefixIconpath: AppSvgs.lockClosed,
                            controller: changePasswordController,
                            suffixIconpath: AppSvgs.arrow_down,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),

                   
                    Padding(
                      padding: AppPaddings.defaultPadding,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SettingScreen(),
                            ),
                          );
                        },
                        child: AbsorbPointer(
                          child: CustomTextField(
                            hint: "Settings",
                            prefixIconpath: AppSvgs.setting,
                            controller: settingsController,
                            suffixIconpath: AppSvgs.arrow_down,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }
}