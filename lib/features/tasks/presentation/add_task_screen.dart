import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter_application_1/core/components/custom_text_field.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_paddings.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final groupController = TextEditingController();
  final endTimeController = TextEditingController();

  bool isLoading = false;
  XFile? image;

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    groupController.dispose();
    endTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.background,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: SvgPicture.asset(
            'assets/images/Arrow - Up 2 - Iconly Pro (1).svg',
          ),
        ),
        title: const Text(
          "Add Task",
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w300,
            color: Color(0xff24252C),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
           
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: image != null
                      ? Image.file(
                          File(image!.path),
                          width: 261.w,
                          height: 207.h,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          AppImages.flag,
                          width: 261.w,
                          height: 207.h,
                          fit: BoxFit.contain,
                        ),
                ),
                Padding(
                  padding: REdgeInsets.only(bottom: 10.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      final picker = ImagePicker();
                      final pickedFile =
                          await picker.pickImage(source: ImageSource.gallery);
                      if (pickedFile != null) {
                        setState(() {
                          image = pickedFile;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    child: Text(
                      'Pick Image',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),

           
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  CustomTextField(
                    controller: titleController,
                    hint: 'Title',
                    prefixIconpath: AppSvgs.profile,
                  ),
                  SizedBox(height: 20.h),
                  CustomTextField(
                    controller: descriptionController,
                    hint: 'Description',
                    prefixIconpath: AppSvgs.profile,
                  ),
                  SizedBox(height: 20.h),
                  CustomTextField(
                    controller: groupController,
                    hint: 'Group',
                    prefixIconpath: AppSvgs.profile,
                    suffixIconpath: 'assets/images/Vector.svg',
                  ),
                  SizedBox(height: 20.h),
                  CustomTextField(
                    controller: endTimeController,
                    hint: 'End Time',
                    prefixIconpath: 'assets/images/calendar.svg',
                  ),
                  SizedBox(height: 40.h),

               
                  if (!isLoading)
                    SizedBox(
                      width: 331.w,
                      height: 48.01.h,
                      child: ElevatedButton(
                        onPressed: () {
                          
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff149954),
                          elevation: 20.0,
                          shadowColor: const Color(0xff149954),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text(
                          "Add Task",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w300,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  if (isLoading) const CircularProgressIndicator(),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}