import 'package:dio/dio.dart';
import 'package:flutter_application_1/features/auth/data/models/user_model.dart';
import 'package:flutter_application_1/serveces/api_service.dart';
import 'package:flutter_application_1/serveces/user_service.dart';

class AuthRepo {
  Future<Map<String, dynamic>> register({
    required String username,
    required String password,
  }) async {
    try {
      final response = await ApiService.dio.post(
        'register',
        data: FormData.fromMap({
          'username': username,
          'password': password,
        }),
      );
      final data = response.data as Map<String, dynamic>;

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (data['status'] == true) {
          return {
            'success': true,
            'message': data['message'] ?? 'Registered successfully',
          };
        }
      }
      return {
        'success': false,
        'message': data['message'] ?? 'Registration failed',
      };
    } catch (e) {
      return {
        'success': false,
        'message': _handleError(e),
      };
    }
  }

  Future<Map<String, dynamic>> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await ApiService.dio.post(
        'login',
        data: FormData.fromMap({
          'username': username,
          'password': password,
        }),
      );
      final data = response.data as Map<String, dynamic>;

      if (response.statusCode == 200 && data['status'] == true) {
        final accessToken = data['access_token'];
        final refreshToken = data['refresh_token'];
        final user = userModel.fromJson(data['user']);

        await UserService.saveAccessToken(accessToken);
        await UserService.saveRefreshToken(refreshToken);
        if (user.username != null) {
          await UserService.saveUsername(user.username!);
        }
        if (user.id != null) {
          final userId = int.tryParse(user.id!);
          if (userId != null) {
            await UserService.saveUserId(userId);
          }
        }
        await UserService.setLoggedIn(true);

        return {
          'success': true,
          'user': user,
        };
      }

      return {
        'success': false,
        'message': data['message'] ?? 'Login failed',
      };
    } catch (e) {
      return {
        'success': false,
        'message': _handleError(e),
      };
    }
  }

  Future<void> logout() async {
    await UserService.logout();
  }

  // ✅ مبسطة جداً
  String _handleError(dynamic e) {
    try {
      if (e is DioError) {
        if (e.response?.data != null) {
          final data = e.response?.data;
          if (data is Map && data['message'] != null) {
            return data['message'];
          }
          if (data is Map && data['error'] != null) {
            return data['error'];
          }
        }
        return e.message ?? 'Something went wrong';
      }
      return e.toString();
    } catch (_) {
      return 'Something went wrong';
    }
  }
}