import 'package:dio/dio.dart';

import '../constants/api_url.dart';

class SmsApiService {
  late Dio _dio;

  static final SmsApiService instance = SmsApiService._();

  SmsApiService._() {
    _dio = Dio();
  }

  Future sendSmsToUser(String phoneNumber) async {
    late String res;
    if (phoneNumber.startsWith('0')) {
      res = phoneNumber.substring(1).padLeft(13, '+233');
    } else {
      res = phoneNumber;
    }
    _dio.post('$sms_api_base_url/booked', data: {'phoneNumber': res});
  }
}
