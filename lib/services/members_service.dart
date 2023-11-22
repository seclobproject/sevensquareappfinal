

import 'package:sevensquare/screens/members/widgets/add_members.dart';

import '../networking/constant.dart';
import '../support/dio_helper.dart';

class MembersService {

  static Future memberslisting() async {
    var dio = await DioHelper.getInstance();
    var response = await dio.get('$baseURL/api/users/get-my-users');
    return response;
  }


  static Future addmember(data) async {
    try {
      var dio = await DioHelper.getInstance();
      var response = await dio.post('$baseURL/api/users',data: data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }


  static Future memberslistinginner(id) async {
    var dio = await DioHelper.getInstance();
    var response = await dio.get('$baseURL/api/users/get-user-by-id/$id');
    return response;
  }

  static Future membersPackages() async {
    try {
      var dio = await DioHelper.getInstance();
      var response = await dio.get('$baseURL/api/packages');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }



}
