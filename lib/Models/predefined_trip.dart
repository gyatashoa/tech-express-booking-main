import 'package:tech_express_app/Models/bus_type.dart';

class PredefinedTrip {
  final String departure;
  final BusType type;
  final String from;
  final String to;

  PredefinedTrip(
      {required this.departure,
      required this.type,
      required this.from,
      required this.to});
}
