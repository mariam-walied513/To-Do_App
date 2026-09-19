import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'screens/article_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TextFormFieldsScreen(),
    );
  }
}

class TextFormFieldsScreen extends StatelessWidget {
  const TextFormFieldsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bookmark',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Arial',
      ),
     
      home: const ArticleScreen(articleId: 0),
    );
  }
}