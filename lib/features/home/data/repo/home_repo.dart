// TODO Implement this library.import 'package:dartz/dartz.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/api_helper.dart';
import '../../../../core/network/end_points.dart';

class HomeRepo {
  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, List>> getTasks() async {
    try {
      var response = await apiHelper.getRequest(
          endPoint: 'tasks',
        isPrivate: true
      );
      var jsonResponse = response.data as Map<String, dynamic>;
      return right(jsonResponse['tasks']);
    } catch (e) {
      return left(apiHelper.handleException(e));
    }
  }
}