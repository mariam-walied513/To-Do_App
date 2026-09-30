import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/custom_text_field.dart';
import 'package:flutter_application_1/core/helper/my_navigator.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/features/auth/data/models/user_model.dart';
import 'package:flutter_application_1/features/profile/data/repo/profile_repo.dart';
import 'package:flutter_application_1/features/profile/presentation/views/change_password_screen.dart';
import 'package:flutter_application_1/features/profile/presentation/views/setting_screen.dart';
import 'package:flutter_application_1/features/profile/presentation/views/update_profile_screen.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final Profilerepo _profileRepo = Profilerepo();
  final TextEditingController _profileController = TextEditingController();

  userModel? _userModel;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchProfileData();
  }

  @override
  void dispose() {
    _profileController.dispose();
    super.dispose();
  }

  Future<void> _fetchProfileData() async {
    setState(() {
      _isLoading = true;
    });

    final result = await _profileRepo.getUser();

    if (mounted) {
      result.fold(
        (error) {
          setState(() {
            _isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error),
              backgroundColor: Colors.red,
            ),
          );
        },
        (user) {
          setState(() {
            _userModel = userModel.fromJson(
              Map<String, dynamic>.from(user.first as Map),
            );
            _isLoading = false;
          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F5F4),
      appBar: AppBar(
        backgroundColor: const Color(0xffF3F5F4),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 60.0,
            backgroundImage: _userModel?.imagePath != null
                ? NetworkImage(_userModel!.imagePath!)
                : const AssetImage('assets/images/flag.png')
                    as ImageProvider,
          ),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hello!",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: Color(0xff24252C),
              ),
            ),
            Text(
              _isLoading
                  ? "Loading..."
                  : (_userModel?.username ?? "Ahmed Saber"),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: Color(0xff24252C),
              ),
            ),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Color(0xff149954),
              ),
            )
          : Column(
              children: [
                SizedBox(height: 20.h),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomTextField(
                   
                    hint: 'Profile',
                    prefixIconpath: AppSvgs.profile,
                    suffixIconpath: AppSvgs.arrow_down,
                    onSuffixPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const UpdateProfile()));
                    },
                    controller: _profileController,

                  ),
                ),

                SizedBox(height: 20.h),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomTextField(hint: 'change password', 
                  controller: _profileController,
                  prefixIconpath: AppSvgs.lockClosed,
                  suffixIconpath: AppSvgs.arrow_down,
                  onSuffixPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const ChangePassword()));
                  }
                  )
                ),

                SizedBox(height: 20.h),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomTextField(
                    hint: 'Settings', 
                    controller: _profileController,
                    prefixIconpath: AppSvgs.setting,
                    suffixIconpath: AppSvgs.arrow_down,
                    onSuffixPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingScreen()));
                    }
                    )
                )
              ],
            ),
    );
  }
}