
import '../networking/constant.dart';
import '../support/dio_helper.dart';

class UserpinService {

  static Future userpinlisting() async {
    var dio = await DioHelper.getInstance();
    var response = await dio.get('$baseURL/api/franchise');
    return response;
  }


}
