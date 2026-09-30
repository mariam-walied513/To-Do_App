import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/features/auth/data/models/task_model.dart';
import 'package:flutter_application_1/features/tasks/data/repo/task_repo.dart';

import 'package:flutter_application_1/features/tasks/presentation/add_task_screen.dart'; 
import 'package:flutter_application_1/features/tasks/presentation/done_task_screen.dart'; 
import 'package:flutter_application_1/features/profile/presentation/views/profile_screen.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TaskRepo _taskRepo = TaskRepo();

  List<TaskModel> _tasks = [];
  bool _isLoading = true;
  String? _errorMessage;
  String _userName = '';

  @override
  void initState() {
    super.initState();
    _fetchTasks();
  }

  Future<void> _fetchTasks() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final result = await _taskRepo.getTasks();

    if (mounted) {
      result.fold(
        (error) {
          setState(() {
            _isLoading = false;
            _errorMessage = error;
          });
        },
        (tasksList) {
          setState(() {
            _tasks = tasksList;
            _isLoading = false;
          });
        },
      );
    }
  }

  Future<void> _navigateToAddTask() async {
    final bool? isAdded = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddTask(), 
      ),
    );

    if (isAdded == true) {
      _fetchTasks();
    }
  }

  Future<void> _navigateToTaskDetails(TaskModel task) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DoneTaskScreen(task: task), 
      ),
    );
    _fetchTasks(); 
  }

  void _navigateToProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Profile(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F5F4),
      appBar: AppBar(
        backgroundColor: const Color(0xffF3F5F4),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: _navigateToProfile,
            child: CircleAvatar(
              backgroundImage: AssetImage(
                AppImages.flag,
              ),
            ),
          ),
        ),
        title: GestureDetector(
          onTap: _navigateToProfile,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hello!",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff24252C),
                ),
              ),
              Text(
                _userName.isNotEmpty ? _userName : "User",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff24252C),
                ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddTask,
        backgroundColor: const Color(0xff149954),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: SvgPicture.asset(
          AppSvgs.add_task,
          width: 24.w,
          height: 24.h,
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: Color(0xff149954),
        ),
      );
    }

    if (_errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _errorMessage!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 12.h),
              ElevatedButton(
                onPressed: _fetchTasks,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff149954),
                ),
                child: const Text("Retry"),
              ),
            ],
          ),
        ),
      );
    }

    if (_tasks.isEmpty) {
      return RefreshIndicator(
        onRefresh: _fetchTasks,
        color: const Color(0xff149954),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 150.h,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "There are no tasks yet,\nPress the button \nTo add New Task",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Color(0xff24252C),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SvgPicture.asset(
                    'assets/images/55024598_9264826 1.svg',
                    width: 375.w,
                    height: 268.h,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _fetchTasks,
      color: const Color(0xff149954),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
                    color: Color(0xff24252C),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFCEEBDC),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${_tasks.length}',
                    style: const TextStyle(
                      color: Color(0xFF149954),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: _tasks.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final task = _tasks[index];
                  return _buildTaskCard(task);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskCard(TaskModel task) {
    return GestureDetector(
      onTap: () => _navigateToTaskDetails(task), 
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: task.isCompleted
              ? const Color(0xFFE8F5E9)
              : const Color(0xFFCEEBDC),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 4),
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
                Expanded(
                  child: Text(
                    task.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF24252C),
                      decoration: task.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ),
                Icon(
                  task.isCompleted
                      ? Icons.check_circle
                      : Icons.radio_button_unchecked,
                  color: task.isCompleted
                      ? const Color(0xFF149954)
                      : Colors.grey[600],
                  size: 20,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              task.description,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: const Color(0xff24252C),
                height: 1.3,
                decoration: task.isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            if (task.imagePath != null && task.imagePath!.isNotEmpty) ...[
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  task.imagePath!,
                  height: 140.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const SizedBox.shrink(),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}