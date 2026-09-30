import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/network/api_helper.dart';
import 'package:flutter_application_1/core/network/end_points.dart';
import 'package:flutter_application_1/features/auth/data/models/user_model.dart';

String? accessToken;
String? refreshToken;

class AuthRepo {
  final ApiHelper apiHelper = ApiHelper();

  Future<Either<String, userModel>> login({
    required String username,
    required String password,
  }) async {
    try {
      var response = await apiHelper.postRequest(
        endPoint: EndPoints.login,
        data: {
          'username': username,
          'password': password,
        },
      );

      print('Response Data: ${response.data}');

      final dynamic data = response.data;
      if (data is! Map<String, dynamic>) {
        return left('Invalid response format from server');
      }

      final jsonResponse = data;

      accessToken = jsonResponse['access_token']?.toString();
      refreshToken = jsonResponse['refresh_token']?.toString();

      if (jsonResponse['user'] != null && jsonResponse['user'] is Map<String, dynamic>) {
        final user = userModel.fromJson(jsonResponse['user']);
        return right(user);
      } else {
        return left('User data not found in response');
      }

    } catch (e) {
      return left(apiHelper.handleException(e));
    }
  }

  Future<Either<String, String>> register({
    required String username,
    required String password,
    String? imagePath,
  }) async {
    try {
      var response = await apiHelper.postRequest(
        endPoint: EndPoints.register,
        data: {
          'username': username,
          'password': password,
          if (imagePath != null)
            'image': await MultipartFile.fromFile(
              imagePath,
              filename: imagePath.split('/').last,
            ),
        },
      );

      final dynamic data = response.data;
      if (data is Map<String, dynamic>) {
        return right(data['message']?.toString() ?? 'Registration Successful');
      }

      return right('Registration Successful');

    } catch (e) {
      return left(apiHelper.handleException(e));
    }
  }
}