import 'package:flutter/material.dart';

import '../home/booking_details.dart';
import '../utils/constants.dart';

class TicketModel {
  final String busImage;
  final String price;
  final String endtime;
  final String startTime;
  final String date;
  final String from;
  final String to;
  final String typeCar;
  final String aviableSeat;

  TicketModel( 
      {required this.busImage,
      required this.price,
      required this.endtime,
      required this.startTime,
      required this.date,
      required this.from,
      required this.to,
      required this.typeCar,
      required this.aviableSeat});
}

List<TicketModel> listOfaviableTicket = [
  TicketModel(
      busImage: "assets/images/bus1.png",
      endtime: "10:30",
      price: "50",
      startTime: "6:30",
      date: "24/09/2022",
      from: "Accra",
      to: "Kumasi",
      typeCar: "VVIP",
      aviableSeat: "1"),
  TicketModel(
      busImage: "assets/images/bus2.png",
      endtime: "10:30",
      price: "25.34",
      startTime: "6:30",
      date: "23/09/2022",
      from: "Kumasi",
      to: "Takoradi",
      typeCar: "STC",
      aviableSeat: "9"),
  TicketModel(
      busImage: "assets/images/bus4.png",
      endtime: "02:30",
      price: "25.0",
      startTime: "10:30",
      date: "03/09/2022",
      from: "Accra",
      to: "Takoradi",
      typeCar: "Ford",
      aviableSeat: "5"),
  TicketModel(
      busImage: "assets/images/B3.png",
      endtime: "10:30",
      price: "30.0",
      startTime: "04:30",
      date: "03/09/2022",
      from: "Accra",
      to: "Takoradi",
      typeCar: "Ford",
      aviableSeat: "2"),
];

class TicketMovingCard extends StatelessWidget {
  final TicketModel ticketModel;
  const TicketMovingCard({
    Key? key,
    required double width,
    required this.ticketModel,
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
              ticketModel.busImage,
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
                    '${ticketModel.startTime}pm',
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
                    ticketModel.from,
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
                    ticketModel.to,
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins-Bold',
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${ticketModel.aviableSeat} seats available',
                style: const TextStyle(
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
                    builder: (context) => BookingDetails(ticketModel: ticketModel),
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
