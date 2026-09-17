import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/custom_svg.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_paddings.dart';
import '../../data/repo/home_repo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;

  @override
  void initState() {
    getTasks();
    super.initState();
  }
  String? errorMsg;
  List? tasks;
  getTasks()async{

    setState(() {
      errorMsg = null;
      tasks = null;
      isLoading = true;
    });
    HomeRepo repo = HomeRepo();
    var result = await repo.getTasks();
    result.fold(
        (String e){
          setState(() {
            errorMsg = e;
          });
        },
        (List t){
          setState(() {
            tasks = t;
          });
        }
    );
    setState(() {
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(AppImages.flag),
              radius: 30.r,
            ),
            SizedBox(width: 16.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hello!',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 12.sp,
                  color: AppColors.black
                ),),
                SizedBox(height: 4.h,),
                Text('User Name',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16.sp,
                      color: AppColors.black
                  ),),

              ],
            )
          ],
        )
      ),
      body: Padding(
        padding: AppPaddings.defaultPadding,
        child: isLoading?
            CircularProgressIndicator()
        :
            errorMsg != null?
                Center(child: Text(errorMsg!))
            :
                tasks!= null && tasks?.isNotEmpty == true?
        Column(
          children: [
            SizedBox(height: 30.h,),
            Row(
              children: [
                Text('Tasks',style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                  color: AppColors.black
                ),),
                SizedBox(width: 20.w,),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  padding: REdgeInsets.symmetric(horizontal: 5),
                  child: Text('5', style: TextStyle(
                    color: AppColors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400
                  ),),
                )
              ],
            ),
            SizedBox(height: 30.h,),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) =>  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: AppColors.primaryLight,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 4.r,
                          spreadRadius: 0,
                          color: Colors.black.withValues(alpha: 0.25)
                        )
                      ]
                    ),
                    padding: REdgeInsets.all(13),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(tasks![index]['title'], style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: AppColors.grey
                              ),),
                              SizedBox(height: 13.h,),
                              Text(tasks![index]['description'], style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 14.sp,
                                color: AppColors.black,

                              ),maxLines: 2, overflow: TextOverflow.ellipsis,)
                            ],
                          ),
                        ),
                        SizedBox(width: 5.w,),
                        Text(tasks![index]['created_at'],
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: AppColors.grey
                        ),)
                      ],
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 20.h,),
                  itemCount: tasks!.length
              ),
            ),
          ],
        )
                    :
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('There are no tasks yet,\nPress the button\nTo add New Task ',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w300,
                            color: AppColors.black

                          ),
                          textAlign: TextAlign.center,),
                          SizedBox(height: 60.h,),
                          Icon(Icons.add_task,
                            size: 300.w,
                          )
                        ],
                      ),
                    )
                    

        ,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){},
        shape: CircleBorder(),
        backgroundColor: AppColors.primary,
        child: CustomSvg(path: AppSvgs.add_task),
      ),
    );
  }
}