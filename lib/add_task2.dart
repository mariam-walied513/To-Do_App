import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';



class AddTask2 extends StatefulWidget{
  const AddTask2 ({super.key});
  @override
  State<AddTask2> createState() => _AddTask2State();
}

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddTask2();
  }
}
class _AddTask2State extends State<AddTask2> {
  String? selectedGroup;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF3F5F4),
        appBar:
        AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xffF3F5F4),
          elevation: 0,
          leading: Padding(
              padding:
              const EdgeInsets.all(8),
              child: SvgPicture.asset('assets/images/Arrow - Up 2 - Iconly Pro (1).svg'
                // width:21.w,
                // height:21.h
              )


          ),
          title: Text(
              "Add Task",
              style: TextStyle(
                  fontSize:19,
                  fontWeight: FontWeight.w300,
                  color: const Color(0xff24252C)
              )
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/GettyImages-1315607788 3.png',
                      width:261,
                      height:207,
                      fit:
                      BoxFit.contain,
                    ),
                    SizedBox(height: 20),
                    Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 20),
                        child:TextFormField(
                            enabled: true,
                            decoration: InputDecoration(
                                filled: true,
                                hintText:'Task01',
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: const Color(0xff24252C)
                                ),
                                fillColor: const Color(0xffFFFFFF),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(color: const Color(0xffCDCDCD))
                                ),
                                labelText:'Title',
                                labelStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w200,
                                    color: const Color(0xff6E6A7C)
                                )
                            )
                        )
                    ),
                    SizedBox(height: 20),
                    Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 20),
                        child:TextFormField(
                            maxLines: 4,
                            enabled: true,
                            decoration: InputDecoration(
                              filled: true,
                              hintText:'Go for grocery to buy some products. Go for \n grocery to buy some products. Go for grocery to buy some products.\n Go for grocery to buy some products.',
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: const Color(0xff24252C)
                              ),
                              labelText:'Description',
                              labelStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w200,
                                  color: const Color(0xff6E6A7C)
                              ),
                              fillColor: const Color(0xffFFFFFF),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: const Color(0xffCDCDCD))
                              ),
                            )
                        )
                    ),
                    SizedBox(height: 20),


                    DropdownButtonFormField<String>(
                        value: selectedGroup,
                        hint: const Text('Group'),
                        icon: SvgPicture.asset('assets/images/Vector.svg'),
                        dropdownColor: const Color(0xFFE8ECEF),
                        borderRadius: BorderRadius.circular(15),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFE8ECEF),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            )
                        ),
                        items: [
                          DropdownMenuItem(
                              value: 'Home',
                              child: Row(
                                  children: [
                                    SvgPicture.asset('assets/images/Group 1000002824.svg'),
                                    const SizedBox(width: 12),
                                    const Text('Home',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff24252C),
                                        )
                                    ),
                                  ]
                              )
                          ),
                          DropdownMenuItem(
                              value: 'Personal',
                              child: Row(
                                  children: [
                                    SvgPicture.asset('assets/images/Group 28.svg'),
                                    const SizedBox(width: 12),
                                    const Text('Personal',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff24252C),
                                        )
                                    )
                                  ])
                          ),
                          DropdownMenuItem(
                              value: 'Work',
                              child: Row(
                                  children: [
                                    SvgPicture.asset('assets/images/Group 1000002771.svg'),
                                    const SizedBox(width: 12),
                                    const Text('Work',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff24252C),
                                        )
                                    )
                                  ]
                              )
                          ),

                        ],
                        onChanged: (value){
                          setState(() {
                            selectedGroup = value;
                          });
                        }
                    ),




                    SizedBox(height: 20),
                    Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 20),
                        child:TextFormField(
                            enabled: true,
                            decoration: InputDecoration(
                                filled: true,
                                hintText:'30 June, 2022    10:00 pm',
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: const Color(0xff24252C)
                                ),
                                fillColor: const Color(0xffFFFFFF),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(color: const Color(0xffCDCDCD))
                                ),
                                labelText:'End Time',
                                labelStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w200,
                                    color: const Color(0xff6E6A7C)
                                ),
                                prefixIcon: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: SvgPicture.asset('assets/images/calendar.svg',
                                        width:24,
                                        height:24
                                    )
                                )
                            )
                        )
                    ),
                    const SizedBox(height: 30,),
                    SizedBox(
                        width: 331.w,
                        height: 48.01.h,
                        child: ElevatedButton(
                            onPressed:(){},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff149954),
                                elevation:20.0,
                                shadowColor: const Color(0xff149954),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),

                                )
                            ),
                            child: Text(
                                "Add Task",
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w300,
                                  color: const Color(0xffFFFFFF),
                                )
                            )
                        )
                    ),
                    SizedBox(height:50),
                  ]
              )
          ),
        )

    );


  }
}