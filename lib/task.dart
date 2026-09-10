import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white, 
        body: 
           Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Row(
                  children: [
                    const Text(
                      'Tasks',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(width: 12),
                  
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD4EBD9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        '5',
                        style: TextStyle(
                          color: Color(0xFF2E6A3E),
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity, 
                  child: Container(
                    padding: const EdgeInsets.all(20), 
                    decoration: BoxDecoration(
                      color: const Color(0xFFD4EBD9), 
                      borderRadius: BorderRadius.circular(24), 
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,  
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'My First Task',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF5A625C),   
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,  
                              children: const [
                                Text(
                                  '11/03/2025',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF5A625C),
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  '05:00 PM',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF5A625C),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 12), 
                        
                        const Text(
                          'Improve my English skills by\ntrying to speek',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                            height: 1.3, 
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
// }  
// void main() {
//   runApp(const MyApp());
//   }
//   class MyApp extends StatelessWidget {
//     const MyApp({super.key});
//     @override
//     Widget build(BuildContext context){
//       return MaterialApp(
//         debugShowCheckedModeBanner:false ,
//         home: Scaffold(
//           backgroundColor: Colors.white,
//           body:  Padding(padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children:[
//               Row(
//                 children:[
//                   const Text('Task'),
//                   const SizedBox(width: 12),
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
//                     decoration: BoxDecoration(
//                       color: const Color.fromARGB(255, 157, 220, 159),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: const Text('5',
//                     style: TextStyle(
//                         color: Color.fromARGB(255, 0, 0, 0),
//                         fontWeight: FontWeight.bold,
//                         fontSize: 13,

//                     ),
//                     ),
//                   ),
                    
//                 ],
                
//                 ),
                
//             ],

//             ),
//          ),
//         ),

//         );
//     }
//   }

}