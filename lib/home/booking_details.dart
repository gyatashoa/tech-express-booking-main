import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_express_app/Models/predefined_trip.dart';
import 'package:tech_express_app/home/trip_booking.dart';

class BookingDetails extends StatelessWidget {
  final PredefinedTrip? predefinedTrip;

  const BookingDetails({super.key, this.predefinedTrip});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Purchase Ticket',
          style: TextStyle(fontFamily: 'Poppins-Regular'),
        ),
      ),
      body: TripsBooking(
        predefinedTrip: predefinedTrip,
      ),
    );
  }
}
