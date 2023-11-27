

import 'package:sevensquare/screens/members/widgets/add_members.dart';

import '../networking/constant.dart';
import '../support/dio_helper.dart';

class WithdrawalService {


  static Future withdrawal(data) async {
    try {
      var dio = await DioHelper.getInstance();
      var response = await dio.post('$baseURL/api/wallet/withdraw',data: data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }





}
