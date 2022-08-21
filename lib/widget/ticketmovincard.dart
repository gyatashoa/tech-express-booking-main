import 'package:flutter/material.dart';
import 'package:tech_express_app/Models/predefined_trip.dart';

import '../home/booking_details.dart';
import '../utils/constants.dart';

class TicketMovingCard extends StatelessWidget {
  final PredefinedTrip predefinedTrip;
  const TicketMovingCard({
    Key? key,
    required double width,
    required this.predefinedTrip,
  })  : _width = width,
        super(key: key);

  final double _width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 40),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: _width * 0.33,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 4,
                spreadRadius: 3,
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              predefinedTrip.type.busImage,
              height: 150,
              width: 200,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Departs at',
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Poppins-Regular',
                        fontSize: 14),
                  ),
                  Text(
                    predefinedTrip.departure.split('-').last.trim(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins-Bold',
                        fontSize: 18),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.redAccent,
                      ),
                      Text(
                        'From',
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Poppins-Regular',
                            fontSize: 14),
                      ),
                    ],
                  ),
                  Text(
                    predefinedTrip.from,
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins-Bold',
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.location_on,
                        color: Colors.green,
                      ),
                      Text(
                        'To',
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Poppins-Regular',
                            fontSize: 14),
                      ),
                    ],
                  ),
                  Text(
                    predefinedTrip.to,
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins-Bold',
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '5 seats available',
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Poppins-Regular',
                    fontSize: 10),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingDetails(
                      predefinedTrip: predefinedTrip,
                    ),
                  ),
                );
              },
              child: Container(
                height: 38,
                width: 150,
                decoration: BoxDecoration(
                  color: deepGreen,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                    child: Text(
                  "Book now",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: 'Poppins-Light'),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
