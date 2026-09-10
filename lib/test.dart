import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
// void main(){
//   runApp(const MyApp());

// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context){
//     return ScreenUtilInit(
//       designSize: Size(375,812),
//       builder:(_,child) => MaterialApp(
//         debugShowCheckedModeBanner: false,
//        theme: ThemeData(
//           fontFamily: 'Lexend_Deca'
//         ),
//         home: HomeScreen()
       
       
   
//       )
//     );
//   }
// }
//     class HomeScreen extends StatelessWidget {
//       const HomeScreen({super.key});
//       @override
//       Widget build(BuildContext context){
//         return Scaffold(
//           appBar: AppBar(
//             centerTitle: true,
//             backgroundColor: Colors.green [300],
//             leading: Icon(Icons.arrow_back_ios_new_outlined,
//             color: Colors.black,
//               size: 15.sp,
//             ),


//             title: Text("Home Screen",
//             style: TextStyle(
//               fontSize: 10.sp,
//               fontWeight: FontWeight.w300,
//               color: Colors.black, 
//             ),
//             ),
            
//              actions: [
//               Icon(Icons.person_outline_outlined,
//               color: Colors.black,
//               size: 15.sp,
//               ),
//               SizedBox(width: 20.w,)
//              ]
//             ),
//             body: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children:[
//                   SvgPicture.asset('assets/images/Group.svg',
//                   height: 400.h,
//                   width: 400.w,
//                   ),
//                   SizedBox(height: 50.h,),
//                   Text('welcome to the Home Screen',
//                   style: TextStyle(
//                     fontSize: 10.sp,
//                     fontWeight: FontWeight.w300,
//                     color: Colors.black
//                   ),
//                   ),
                  
                
//                 ]
//               ),
//             )
//           );
          

    
    
       
           

  //     }

      
    
      
  // }


  



  // void main(){
  //  runApp(const MyApp());
  // }
  // class MyApp extends StatelessWidget {
  //   const MyApp({super.key});
  //   @override
  //  Widget build(BuildContext context){
  //     return MaterialApp(
  //       debugShowCheckedModeBanner:false ,
  //       home: Scaffold(
  //         appBar: AppBar(
  //           title: const Text('Flutter TextFormField '),
  //           backgroundColor: Colors.blue,
            
  //         ),
  //         body: const TextFormFieldExample(),
          
            
  //     ),
      
  //     );
  //  }
  // }
  // class TextFormFieldExample extends StatelessWidget {
  //   const TextFormFieldExample({super.key});
  //   @override
  //   Widget build(BuildContext context){
  //     return Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
  //       child:TextFormField(
  //         enabled: true,
  //         decoration: InputDecoration(
  //           hintText: 'Enter your name',
  //           prefixIcon: const Icon(Icons.person),
  //           enabledBorder: const UnderlineInputBorder(
  //             borderSide: BorderSide(color: Colors.blue),
  //           ),
  //           focusedBorder: UnderlineInputBorder(
  //             borderSide: const BorderSide(color: Colors.blue, width: 2),
  //             borderRadius: BorderRadius.circular(20),
  //           ),
           
  //         ),
  //         onTap: () {
  //           showTimePicker(context: context, initialTime: TimeOfDay .now());}
  //       ),
       
  //     );
      
  //   }
  // }
  

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: SafeArea(
//           child: TextFormFieldsExample(),
//         ),
//       ),
//     );
//   }
// }

// class TextFormFieldsExample extends StatelessWidget {
//   const TextFormFieldsExample({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             const SizedBox(height: 10),
//             Image.asset('assets/images/GettyImages-1315607788 3.png',
             
//               height: 400,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),

//             TextFormField(
//               enabled: true,
//               decoration: InputDecoration(
//                 hintText: 'Enter your name',
//                 prefixIcon: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: SvgPicture.asset('assets/images/Profile - Iconly Pro.svg.'),
//                 ),
//                 enabledBorder: const UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.blue),
//                 ),
//                 focusedBorder: const UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.blue, width: 2),
//                 ),
//               ),
//               onTap: () {},
//             ),
//             const SizedBox(height: 20),

           
            

//             TextFormField(
//               enabled: true,
//               obscureText: true,
//               obscuringCharacter: '*',
//               decoration: InputDecoration(
//                 hintText: 'Enter your password',
//                 prefixIcon: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: SvgPicture.asset('assets/images/Unlock - Iconly Pro.svg'),
//                 ),
//                 enabledBorder: const UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.blue),
//                 ),
//                 focusedBorder: const UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.blue, width: 2),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xff57a79e),
//                 minimumSize: const Size(double.infinity, 50),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               onPressed: () {},
//               child: const Text(
//                 'Login',
//                 style: TextStyle(color: Colors.white, fontSize: 18),
//               ),
//             ),
//             const SizedBox(height: 15),

            
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text("Don't Have An Account? "),
//                 TextButton(
//                   onPressed: () {},
//                   child: const Text(
//                     'Register',
//                     style: TextStyle(color: Colors.teal),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: DropdownButtonFormField (
//                 decoration: InputDecoration(
//                 filled: true,
//                 fillColor: const Color(0xFFFFFFFF),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10)),
                
//                   labelText: 'Group',
//                   labelStyle: const TextStyle(color: const Color(0xFF6E6A7C)),
                  

//               )
              
            
//           ],
//         ),
//       ),
//     );
//   }
  
// }
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: TextFormFieldsExample(),
        ),
      ),
    );
  }
}

class TextFormFieldsExample extends StatefulWidget {
  const TextFormFieldsExample({super.key});

  @override
  State<TextFormFieldsExample> createState() => _TextFormFieldsExampleState();
}

class _TextFormFieldsExampleState extends State<TextFormFieldsExample> {
  // متغير لتخزين القيمة المختارة في الـ Dropdown
  String? selectedGroup;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),

            // 1. Image Asset (العلم)
            Image.asset(
              'assets/images/GettyImages-1315607788 3.png',
              height: 400,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),

            // 2. TextFormField الأول (الاسم)
            TextFormField(
              enabled: true,
              decoration: InputDecoration(
                hintText: 'Enter your name',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SvgPicture.asset('assets/images/Profile - Iconly Pro.svg'),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
              ),
              onTap: () {},
            ),
            const SizedBox(height: 20),

            // 3. TextFormField الثاني (كلمة المرور)
            TextFormField(
              enabled: true,
              obscureText: true,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                hintText: 'Enter your password',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SvgPicture.asset('assets/images/Unlock - Iconly Pro.svg'),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 4. زر Login
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff57a79e),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            const SizedBox(height: 15),

            // 5. Row الخاص بنص Don't Have An Account?
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't Have An Account? "),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.teal),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // 6. كود الـ Dropdown المطابق للصورة الأولى
            DropdownButtonFormField<String>(
              value: selectedGroup,
              hint: const Text('Group'),
              icon: const Icon(Icons.keyboard_arrow_down),
              dropdownColor: const Color(0xFFE8ECEF),
              borderRadius: BorderRadius.circular(15),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFE8ECEF),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
              items: [
                DropdownMenuItem(
                  value: 'Home',
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.purple.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.home, color: const Color(0xffFF1C92), size: 20),
                      ),
                      const SizedBox(width: 12),
                      const Text('Home'),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: 'Personal',
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.teal.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.person, color: const Color(0xffCEEBDC), size: 20),
                      ),
                      const SizedBox(width: 12),
                      const Text('Personal'),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: 'Work',
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.work, color: const Color(0xffFFFFFF), size: 20),
                      ),
                      const SizedBox(width: 12),
                      const Text('Work'),
                    ],
                  ),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  selectedGroup = value;
                });
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}