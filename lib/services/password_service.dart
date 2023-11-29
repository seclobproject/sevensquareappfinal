

import 'package:sevensquare/screens/members/widgets/add_members.dart';

import '../networking/constant.dart';
import '../support/dio_helper.dart';

class PasswordService {

  static Future changepassword(data) async {
    try {
      var dio = await DioHelper.getInstance();
      var response = await dio.put('$baseURL/api/users/change-password',data: data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

}
