import 'package:tech_express_app/Models/bus_type.dart';
import 'package:tech_express_app/Models/predefined_trip.dart';
import 'package:tech_express_app/data/arrival_departure_data.dart';
import 'package:tech_express_app/data/location.dart';

final predefinedTripsData = <PredefinedTrip>[
  PredefinedTrip(
      departure: arrivalDepartureData[0],
      type: BusType.VVIP,
      from: locationData[0],
      to: locationData[3]),
  PredefinedTrip(
      departure: arrivalDepartureData[1],
      type: BusType.FORD,
      from: locationData[1],
      to: locationData[2]),
  PredefinedTrip(
      departure: arrivalDepartureData[2],
      type: BusType.STC,
      from: locationData[2],
      to: locationData[1]),
  PredefinedTrip(
      departure: arrivalDepartureData[3],
      type: BusType.VIP,
      from: locationData[3],
      to: locationData[0]),
];
