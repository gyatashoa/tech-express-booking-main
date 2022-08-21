import 'package:tech_express_app/data/location.dart';

double computePrice(String? to, String? from) {
  if (to == locationData[0] || from == locationData[0]) {
    if (to == locationData[1] || from == locationData[1]) {
      return 90.00;
    }
    if (to == locationData[2] || from == locationData[2]) {
      return 150.00;
    }
    if (to == locationData[3] || from == locationData[3]) {
      return 40.00;
    }
  }
  if (to == locationData[1] || from == locationData[1]) {
    if (to == locationData[2] || from == locationData[2]) {
      return 200.00;
    }
    if (to == locationData[3] || from == locationData[3]) {
      return 95.00;
    }
  }
  if (to == locationData[2] || from == locationData[2]) {
    if (to == locationData[3] || from == locationData[3]) {
      return 120;
    }
  }
  // if (to == locationData[3] || from == locationData[3]) {}
  return 0;
}
