

import 'package:sevensquare/screens/members/widgets/add_members.dart';

import '../networking/constant.dart';
import '../support/dio_helper.dart';

class WalletService {

  static Future wallets() async {
    try {
      var dio = await DioHelper.getInstance();
      var response = await dio.get('$baseURL/api/wallet');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
  static Future walletstransation() async {
    try {
      var dio = await DioHelper.getInstance();
      var response = await dio.get('$baseURL/api/wallet/all-transactions');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }


}
