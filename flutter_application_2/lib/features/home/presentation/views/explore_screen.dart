import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/auth/presentation/views/welcome_screen.dart';
import 'package:flutter_application_2/features/home/presentation/views/search_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/core/utils/app_paddings.dart';
import 'package:flutter_application_2/core/utils/app_assets.dart';
import 'package:flutter_application_2/core/helper/my_navigator.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {

  @override
  void initState() {
    super.initState();
        Future.delayed(const Duration(seconds: 3)).then((v) {
      MyNavigator.goTo(context, topage: const SearchMapScreen());
    });
  }
  Widget build(BuildContext context) {
    return Scaffold();
  }
}