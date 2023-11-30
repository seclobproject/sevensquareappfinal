

import 'package:sevensquare/screens/members/widgets/add_members.dart';

import '../networking/constant.dart';
import '../support/dio_helper.dart';

class SalaryService {

  static Future salary() async {
    try {
      var dio = await DioHelper.getInstance();
      var response = await dio.get('$baseURL/api/salary/get-salary');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }



}
