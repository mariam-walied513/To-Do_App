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
   Future<Either<String, List>> changePassword({required String accessToken}) async{
    try{
      var response = await apiHelper.postRequest(

        endPoint: EndPoints.changePassword,
        isPrivate: true,
        data: {'access_token':accessToken},
         );
         var jsonResponse = response.data as Map<String, dynamic>;
         return right(jsonResponse['change_password']);
    }
    catch(e){
      return left(apiHelper.handleException(e));
    }
   }
}

