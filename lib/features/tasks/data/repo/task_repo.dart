import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/network/api_helper.dart';
import 'package:flutter_application_1/core/network/end_points.dart';
import '../../../auth/data/models/task_model.dart';

import 'package:dartz/dartz.dart';



class TaskRepo {
  final ApiHelper apiHelper = ApiHelper();

  Future<Either<String, TaskModel>> addTask({
    required String title,
    required String description,
  }) async {
    try {
      var response = await apiHelper.postRequest(
        endPoint: EndPoints.addTask,
        data: {
          'title': title,
          'description': description,
        },
      );

      var jsonResponse = response.data as Map<String, dynamic>;

      print('Response Data: ${response.data}');

      TaskModel taskModel = TaskModel.fromJson(jsonResponse['task'] ?? jsonResponse['data']);
      return right(taskModel);

    } catch (e) {
      return left(apiHelper.handleException(e));
    }
  }

  Future<Either<String, List<TaskModel>>> getTasks() async {
    try {
      var response = await apiHelper.getRequest(
        endPoint: EndPoints.getTasks,
      );

      var jsonResponse = response.data;
      List<dynamic> tasksListJson;

      if (jsonResponse is List) {
        tasksListJson = jsonResponse;
      } else {
        tasksListJson = jsonResponse['tasks'] ?? jsonResponse['data'] ?? [];
      }

      List<TaskModel> tasks = tasksListJson
          .map((taskJson) => TaskModel.fromJson(taskJson as Map<String, dynamic>))
          .toList();

      return right(tasks);

    } catch (e) {
      return left(apiHelper.handleException(e));
    }
  }

  Future<Either<String, TaskModel>> updateTask({
    required String taskId,
    required String title,
    required String description,
  }) async {
    try {
      var response = await apiHelper.putRequest(
        endPoint: '${EndPoints.updateTask}/$taskId',
        data: {
          'title': title,
          'description': description,
        },
      );

      var jsonResponse = response.data as Map<String, dynamic>;
      TaskModel updatedTask = TaskModel.fromJson(jsonResponse['task'] ?? jsonResponse['data']);

      return right(updatedTask);

    } catch (e) {
      return left(apiHelper.handleException(e));
    }
  }

  // 4. دالة حذف المهمة Delete Task
  Future<Either<String, String>> deleteTask({
    required String taskId,
  }) async {
    try {
      var response = await apiHelper.deleteRequest(
        endPoint: '${EndPoints.deleteTask}/$taskId',
      );

      var jsonResponse = response.data as Map<String, dynamic>;
      return right(jsonResponse['message'] ?? 'Task deleted successfully');

    } catch (e) {
      return left(apiHelper.handleException(e));
    }
  }
}