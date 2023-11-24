

import 'package:sevensquare/screens/members/widgets/add_members.dart';

import '../networking/constant.dart';
import '../support/dio_helper.dart';

class ProfileService {


  static Future profileimage(data) async {
    // print(username);
    var dio = await DioHelper.getInstance();
    var response = await dio.post('$baseURL/api/users/verify-user',data:data);
    return response;
  }




}