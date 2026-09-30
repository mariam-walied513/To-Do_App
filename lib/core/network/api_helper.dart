import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/network/end_points.dart';

class ApiHelper {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: EndPoints.baseUrl,
    ),
  );
  String? accessToken;
  String? refreshToken;

  Future<Response> postRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    bool isFormData = true,
    bool isPrivate = false,
  }) async {
    return _dio.post(
      endPoint,
      data: data != null
          ? isFormData
              ? FormData.fromMap(data)
              : data
          : null,
      options: Options(
        headers: {
          if (isPrivate) 'Authorization': 'Bearer $accessToken',
        },
      ),
    );
  }

  Future<Response> getRequest({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    bool isPrivate = false,
  }) async {
    return _dio.get(
      endPoint,
      queryParameters: queryParameters,
      options: Options(
        headers: {
          if (isPrivate) 'Authorization': 'Bearer $accessToken',
        },
      ),
    );
  }

  /// دالة المعالجة المعدلة بدقة
  String handleException(Object e) {
    // طباعة الخطأ الأصلي في التيرمينال لمعرفة التفاصيل بدقة أثناء التطوير
    print('================ API EXCEPTION ================');
    print('Exception Type: ${e.runtimeType}');
    print('Exception Details: $e');

    if (e is DioException) {
      if (e.response != null) {
        final dynamic responseData = e.response?.data;

        // إذا كانت الاستجابة عبارة عن Map (JSON)
        if (responseData is Map<String, dynamic>) {
          // جرب استخراج الرسالة من أشهر الحقول المستخدمة في الـ APIs
          String? serverMessage = responseData['message'] ??
              responseData['error'] ??
              responseData['msg'] ??
              responseData['detail'];

          if (serverMessage != null && serverMessage.isNotEmpty) {
            return serverMessage;
          }
        } else if (responseData is String && responseData.isNotEmpty) {
          // إذا أرجع السيرفر نصاً مباشراً
          return responseData;
        }

        // في حال عدم وجود رسالة محددة داخل الاستجابة
        return 'Server error [${e.response?.statusCode}]: ${e.response?.statusMessage ?? "Unknown error"}';
      } else {
        // مشاكل انقطاع الشبكة أو التايم أوت
        switch (e.type) {
          case DioExceptionType.connectionTimeout:
          case DioExceptionType.sendTimeout:
          case DioExceptionType.receiveTimeout:
            return 'Connection timed out. Please check your internet.';
          case DioExceptionType.connectionError:
            return 'Cannot connect to server. Check your network or CORS settings.';
          default:
            return 'Network error happened, try again later.';
        }
      }
    }

    // إذا كان الخطأ خطأ برمجي محلي (Syntax/Cast Exception)
    return 'Unexpected local error: ${e.toString()}';
  }

  deleteRequest({required String endPoint}) {}

  putRequest({required String endPoint, required Map<String, String> data}) {}
}