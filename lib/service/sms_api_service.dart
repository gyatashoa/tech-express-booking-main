import 'package:dio/dio.dart';

import '../constants/api_url.dart';

class SmsApiService {
  late Dio _dio;

  static final SmsApiService instance = SmsApiService._();

  SmsApiService._() {
    _dio = Dio();
  }

  Future sendSmsToUser(
      {required String phoneNumber,
      required String name,
      required String ticketId,
      required double price}) async {
    late String res;
    if (phoneNumber.startsWith('0')) {
      res = '+233${phoneNumber.substring(1)}';
    } else {
      res = phoneNumber;
    }
    try {
      _dio.post('$sms_api_base_url/booked', data: {
        'phoneNumber': res,
        'name': name,
        'price': price.toString(),
        'ticketId': ticketId
      });
    } on Exception {}
  }
}
