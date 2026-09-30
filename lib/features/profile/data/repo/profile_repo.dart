import 'package:dartz/dartz.dart';

import '../../../../core/network/api_helper.dart';
import '../../../../core/network/end_points.dart';

class Profilerepo{
  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, List>> getUser() async{
    try{
      var response = await apiHelper.getRequest(
        endPoint: EndPoints.getUserData,
        isPrivate: true

      );
      var jsonResponse = response.data as Map<String, dynamic>;
      return right(jsonResponse['get_user_data']);

    }
    catch(e){
      return left(apiHelper.handleException(e));
    }
  }
  Future<Either<String, List>> updateProfile({required String accessToken, required String username}) async{
    try{
      var response = await apiHelper.postRequest(
        endPoint: EndPoints.updateProfile,
        isPrivate: true,
        data: {'access_token':accessToken},
      );
      var jsonResponse = response.data as Map<String, dynamic>;
      return right(jsonResponse['update_profile']);

    }
    catch(e){
      return left(apiHelper.handleException(e));
    }
  }
Future<Either<String, String>> changePassword({
  required String oldPassword,
  required String newPassword,
}) async {
  try {
    var response = await apiHelper.postRequest(
      endPoint: EndPoints.changePassword,
      data: {
        'old_password': oldPassword,
        'new_password': newPassword,
      },
    );

    var jsonResponse = response.data as Map<String, dynamic>;
    return right(jsonResponse['message'] ?? 'Password changed successfully');
  } catch (e) {
    return left(apiHelper.handleException(e));
  }

}
}

