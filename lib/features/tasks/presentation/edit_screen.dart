import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/features/auth/data/models/task_model.dart';
import 'package:flutter_application_1/features/tasks/data/repo/task_repo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';



class TaskDetailScreen extends StatefulWidget {
  final TaskModel? taskModel; 
   const TaskDetailScreen({super.key, this.taskModel});

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  final TaskRepo _taskRepo = TaskRepo();

  bool _isLoading = false;
  bool _isDeleting = false;
  late bool _isDone;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.taskModel?.title ?? '');
    _descriptionController = TextEditingController(text: widget.taskModel?.description ?? '');
    _isDone = widget.taskModel?.isCompleted ?? false;
  }

  Future<void> _handleUpdateTask() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final result = await _taskRepo.updateTask(
      taskId: widget.taskModel?.id ?? '',
      title: _titleController.text.trim(),
      description: _descriptionController.text.trim(),
    );

    if (mounted) setState(() => _isLoading = false);

    result.fold(
      (error) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error), backgroundColor: Colors.red),
          );
        }
      },
      (updatedTask) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Task updated successfully'),
              backgroundColor: Color(0xff149954),
            ),
          );
          Navigator.pop(context, true); //   
        }
      },
    );
  }

  Future<void> _handleMarkAsDone() async {
    setState(() => _isLoading = true);

    final result = await _taskRepo.updateTask(
      taskId: widget.taskModel?.id ?? '',
      title: _titleController.text.trim(),
      description: _descriptionController.text.trim(),
    );

    if (mounted) setState(() => _isLoading = false);

    result.fold(
      (error) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error), backgroundColor: Colors.red),
          );
        }
      },
      (updatedTask) {
        if (mounted) {
          setState(() {
            _isDone = true; 
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Task marked as Done!'),
              backgroundColor: Color(0xff149954),
            ),
          );
        }
      },
    );
  }

  Future<void> _handleDeleteTask() async {
    setState(() => _isDeleting = true);

    final result = await _taskRepo.deleteTask(
      taskId: widget.taskModel?.id ?? '',
    );

    if (mounted) setState(() => _isDeleting = false);

    result.fold(
      (error) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error), backgroundColor: Colors.red),
          );
        }
      },
      (successMessage) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(successMessage),
              backgroundColor: const Color(0xff149954),
            ),
          );
          Navigator.pop(context, true); 
        }
      },
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F5F4),
      appBar: AppBar(
        backgroundColor: const Color(0xffF3F5F4),
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              "assets/images/Arrow left.svg",
            ),
          ),
        ),
        title: const Text(
          'Edit Task',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w300,
            color: Color(0xff24252C),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: GestureDetector(
              onTap: _isDeleting ? null : _handleDeleteTask,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xffE4312B),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    if (_isDeleting)
                      const SizedBox(
                        width: 12,
                        height: 12,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    else ...[
                      SvgPicture.asset('assets/images/Vector (2).svg'),
                      const SizedBox(width: 4),
                      const Text(
                        'Delete',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),

                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                         AppImages.flag,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _isDone ? "Done" : "In Progress",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff24252C),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              _isDone
                                  ? "Congrats!"
                                  : "Believe you can, and you're halfway there.",
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: Color(0xff6E6A7C),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),

                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Home',
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff24252C),
                      ),
                      fillColor: const Color(0xffFFFFFF),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Color(0xffCDCDCD)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Color(0xffCDCDCD)),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SvgPicture.asset('assets/images/Group 1000002824.svg'),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SvgPicture.asset('assets/images/Vector.svg'),
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  TextFormField(
                    controller: _titleController,
                    validator: (val) =>
                        val == null || val.trim().isEmpty ? 'Enter title' : null,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Task Title',
                      labelText: 'Title',
                      labelStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                        color: Color(0xff6E6A7C),
                      ),
                      fillColor: const Color(0xffFFFFFF),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Color(0xffCDCDCD)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Color(0xff149954)),
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  TextFormField(
                    controller: _descriptionController,
                    maxLines: 4,
                    validator: (val) =>
                        val == null || val.trim().isEmpty ? 'Enter description' : null,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Task Description',
                      labelText: 'Description',
                      labelStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                        color: Color(0xff6E6A7C),
                      ),
                      fillColor: const Color(0xffFFFFFF),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Color(0xffCDCDCD)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Color(0xff149954)),
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: '30 June, 2022    10:00 pm',
                      labelText: 'End Time',
                      labelStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                        color: Color(0xff6E6A7C),
                      ),
                      fillColor: const Color(0xffFFFFFF),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Color(0xffCDCDCD)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Color(0xffCDCDCD)),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SvgPicture.asset(
                          'assets/images/calendar.svg',
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 30.h),

                  if (!_isDone) ...[
                    SizedBox(
                      width: double.infinity,
                      height: 48.01.h,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _handleMarkAsDone,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff149954),
                          elevation: 5.0,
                          shadowColor: const Color(0xff149954).withOpacity(0.3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text(
                          'Mark as Done',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w300,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                  ],

                  SizedBox(
                    width: double.infinity,
                    height: 48.01.h,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _handleUpdateTask,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffF3F5F4),
                        elevation: 0,
                        side: const BorderSide(color: Color(0xff149954)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: _isLoading
                          ? SizedBox(
                              width: 24.w,
                              height: 24.h,
                              child: const CircularProgressIndicator(
                                color: Color(0xff149954),
                                strokeWidth: 2.5,
                              ),
                            )
                          : const Text(
                              'Update',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w300,
                                color: Color(0xff149954),
                              ),
                            ),
                    ),
                  ),

                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}