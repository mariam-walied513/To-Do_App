// TODO Implement this library.import 'package:dartz/dartz.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/api_helper.dart';
import '../../../../core/network/end_points.dart';
import 'package:flutter_application_2/core/network/api_helper.dart';

class SearchRepo {
  final ApiHelper apiHelper = ApiHelper();

  Future<Either<String, List>> getWeather({
    required double Lat,
    required double Log,
  }) async {
    
    try {
      var response = await apiHelper.getRequest(
          endPoint: 'weather',
          queryParameters: {
            'lat': "lat",
            'log': "log",
            'appid': '39ef56aa87e0f9d833e66cd9111de959'
          }
        
      );
      var jsonResponse = response.data as Map<String, dynamic>;
      return right(jsonResponse['tasks']);
    } 
    catch (e) {
      return left(apiHelper.handleException(e));
    }
  }
}