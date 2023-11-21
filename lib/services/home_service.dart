

import 'package:sevensquare/screens/members/widgets/add_members.dart';

import '../networking/constant.dart';
import '../support/dio_helper.dart';

class HomeService {


  static Future GetProfile() async {
    try {
      var dio = await DioHelper.getInstance();
      var response = await dio.post('$baseURL/api/users/fetch-profile');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }



}
