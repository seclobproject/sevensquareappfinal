

import '../networking/constant.dart';
import '../support/dio_helper.dart';

class MembersService {

  static Future memberslisting() async {
    var dio = await DioHelper.getInstance();
    var response = await dio.get('$baseURL/api/users/get-my-users');
    return response;
  }


  static Future memberslistinginner(id) async {
    var dio = await DioHelper.getInstance();
    var response = await dio.get('$baseURL/api/users/get-user-by-id/$id');
    return response;
  }

}
