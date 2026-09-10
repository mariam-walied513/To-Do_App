import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home2 extends StatelessWidget{
  const Home2 ({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
       backgroundColor: const Color(0xffF3F5F4),
      appBar: AppBar(
        backgroundColor:const Color(0xffF3F5F4),
        leading: Padding(
          padding: const EdgeInsets.all(8) ,
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/GettyImages-1315607788 3.png'),
          ),

          
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello!",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: const Color(0xff24252C)
                )
              ),
              Text(
                "Ahmed Saber",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: const Color(0xff24252C)
                )

              ),
              

            ],
          

            ),
            


      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){},
        backgroundColor: const Color(0xff149954),
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14) 


        ),
        child: SvgPicture.asset('assets/images/Paper Plus - Iconly Pro.svg',
         width:24.w,
          height:24.h
        ),
        



        
      ),
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
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff24252C),
                      ),
                    ),
                    const SizedBox(width: 12),
                  
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                        color: const Color(0xFFCEEBDC),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        '5',
                        style: TextStyle(
                          color: Color(0xFF149954),
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                SizedBox(
                  width: 335.w, 
                  child: Container(
                    padding: const EdgeInsets.all(20), 
                    decoration: BoxDecoration(
                      color: const Color(0xFFCEEBDC), 
                      borderRadius: BorderRadius.circular(20), 
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
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
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF6E6A7C),   
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,  
                              children: const [
                                Text(
                                  '11/03/2025',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF6E6A7C),
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  '05:00 PM',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF6E6A7C),
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
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: const Color(0xff24252C),
                            height: 1.3, 
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                SizedBox(
                  width: 335.w, 
                  child: Container(
                    padding: const EdgeInsets.all(20), 
                    decoration: BoxDecoration(
                      color: const Color(0xFFCEEBDC), 
                      borderRadius: BorderRadius.circular(20), 
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
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
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF6E6A7C),   
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,  
                              children: const [
                                Text(
                                  '11/03/2025',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF6E6A7C),
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  '05:00 PM',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF6E6A7C),
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
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: const Color(0xff24252C),
                            height: 1.3, 
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                SizedBox(
                  width: 335.w, 
                  child: Container(
                    padding: const EdgeInsets.all(20), 
                    decoration: BoxDecoration(
                      color: const Color(0xFFCEEBDC), 
                      borderRadius: BorderRadius.circular(20), 
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
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
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF6E6A7C),   
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,  
                              children: const [
                                Text(
                                  '11/03/2025',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF6E6A7C),
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  '05:00 PM',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF6E6A7C),
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
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: const Color(0xff24252C),
                            height: 1.3, 
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                SizedBox(
                  width: 335.w, 
                  child: Container(
                    padding: const EdgeInsets.all(20), 
                    decoration: BoxDecoration(
                      color: const Color(0xFFCEEBDC), 
                      borderRadius: BorderRadius.circular(20), 
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
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
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF6E6A7C),   
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,  
                              children: const [
                                Text(
                                  '11/03/2025',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF6E6A7C),
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  '05:00 PM',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF6E6A7C),
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
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: const Color(0xff24252C),
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
        );
  }
}

              

           
  
         
         

      


  
  