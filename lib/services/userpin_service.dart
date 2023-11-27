
import '../networking/constant.dart';
import '../support/dio_helper.dart';

class UserpinService {

  static Future userpinlisting() async {
    var dio = await DioHelper.getInstance();
    var response = await dio.get('$baseURL/api/franchise');
    return response;
  }



  static Future activatedpinlisting() async {
    try {
      var dio = await DioHelper.getInstance();
      var response = await dio.get('$baseURL/api/franchise/get-activated-pins');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }


  static Future addactivepin(data) async {
    try {
      var dio = await DioHelper.getInstance();
      var response = await dio.post('$baseURL/api/franchise/sell-pin',data: data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

}
