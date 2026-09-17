import 'package:flutter_application_2/core/network/end_points.dart';
import 'package:dio/dio.dart';

class ApiHelper{
   Dio _dio = Dio(
     BaseOptions(
      baseUrl : EndPoints.baseUrl
     ),
   );
    String? accessToken;
    String? refreshToken;

    Future<Response> postRequest({
      required String endPoint,
      Map<String, dynamic>? data,
      bool isFormData = true,
      bool isPrivate = false,
    })async{
      return _dio.post(endPoint, 
        data: data!=null?
        isFormData?FormData.fromMap(data):
        data:
        null,
        options: Options(
          headers: {
            if(isPrivate) 'Authorization': 'Bearer $accessToken',
          }
        )

      );
    }
    Future<Response> getRequest({
      required String endPoint,
      Map<String, dynamic>? queryParameters,
       bool isPrivate = false,
    })async{
      return _dio.get(
        endPoint,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            if(isPrivate) 'Authorization': 'Bearer $accessToken',
          }
        )
          
          
           
          );
        // headers:{
        //   if(isPrivate) 'Authorization': 'Bearer $accessToken',
      
        
     
    }
     String handleException(Object e){
         String errorMsg;
         if(e is DioException){
           if(e.response!=null){
          var errorResponse = e.response?.data as Map<String, dynamic>;
           errorMsg = errorResponse['message'];
         }
         else{
           errorMsg = 'Network Error happened try again later';
         }
     }
         else{
           errorMsg = e.toString();

         }

         return errorMsg;
    }
}
   