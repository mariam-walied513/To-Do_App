import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

// void main() {
//   runApp(ScreenUtilInit(
//     designSize:  Size(375, 812),
//     builder:(_,child)=> MaterialApp(
//       debugShowCheckedModeBanner:false ,
//       theme: ThemeData(
//         fontFamily: 'Lexend_Deca'
//         ),
//       home: Scaffold(
//         appBar: AppBar(
//           centerTitle:true ,
//           leading:Icon(Icons.arrow_upward,
//           size: 30,) ,
//           title:Text('Task Page',
//           style: TextStyle(
//             color: Colors.purpleAccent,
//             fontSize: 30
//           ),
//           ) ,
//           actions: [
//             Icon(Icons.check_circle,
//             color: Colors.green,
//             size: 35,
//             ),
//             SizedBox(width: 20,)
//           ],
//         ),
//         body: Column(
//           mainAxisAlignment:MainAxisAlignment.center ,
//           children: [
//             Text('Hello World',
//             textAlign:TextAlign.center ,
//             style:TextStyle(
//               fontSize:50
             
    
             
//             ) ,
//             ),
//             SizedBox(height: 20,),
//             Image.asset("assets/images/GettyImages-1315607788 3.png",
//             height: 0.36*MediaQuery.of(context).size.height,
//             width: double.infinity
//             ),
//             SvgPicture.asset('assets/images/Group.svg',
//             height: 100,
//             width: 100),
//             Icon(Icons.favorite_border,
//             color:Colors.purple ,
//             size:45) ,
//             Row(
//               mainAxisAlignment:MainAxisAlignment.start ,
//               children: [
//                 Text('Task1',
//                 style: TextStyle(
//                   fontSize:50 
    
//                 ),),
//                 Icon(Icons.favorite_border,
//                 color:Colors.pink ,
//                 size: 45,
//                 )
               
//               ],
//             )
    
//           ],
//         ),
//       ),
//     ),
//   ));
// // }
//  void main(){
//   runApp(MyApp());
//  }
//   class MyApp extends StatelessWidget {
//     const MyApp({super.key});
//     @override
//     Widget build(BuildContext context){
//       return ScreenUtilInit(
//         designSize: Size(375,812),
//         builder: (_,child)=> MaterialApp(
//           debugShowCheckedModeBanner: false,
//           theme: ThemeData(
//             fontFamily: 'Lexend_Deca'
//           ),
//           home: HomeScreen()
//         )
//       );
//     }
//   }
//   class HomeScreen extends StatelessWidget {
//     const HomeScreen({super.key});
//     @override
//     Widget build(BuildContext context){
//       return Scaffold(
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.asset("assets/images/GettyImages-1315607788 3.png",
//             height: 0.36*MediaQuery.of(context).size.height,
//             width: double.infinity,
//             fit: BoxFit.cover,
//             ),
//             SvgPicture.asset('assets/images/Group.svg'),

//           ],
//         ),
//       );
        
//   }
  
















  // }

import 'package:flutter/material.dart';
=======
import 'screens/article_screen.dart';
>>>>>>> e71c69096e6699d45a2fb3eae096738262d9d79b

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
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
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Flutter TextFormFields',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),

              // 1. Field عادي بسيط
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your Name',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.person, color: Colors.blue),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 2. Field بـ Icon لون مختلف
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your Name',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.person, color: Colors.amber),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: 'Enter your Name',
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.person, color: Colors.blue),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 4. Field مع إمكانيات الإدخال العادية
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your Name',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.person, color: Colors.teal),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your Name',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.person, color: Colors.redAccent),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
=======
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bookmark',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Arial',
      ),
     
      home: const ArticleScreen(articleId: 0),
>>>>>>> e71c69096e6699d45a2fb3eae096738262d9d79b
    );
  }
}