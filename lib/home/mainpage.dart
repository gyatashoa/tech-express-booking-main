import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tech_express_app/data/predefined_trips_data.dart';
import 'package:tech_express_app/home/booking_details.dart';
import 'package:tech_express_app/widget/available_buses.dart';

import '../utils/constants.dart';
import '../widget/ticketmovincard.dart';
import 'trips/trip_ticket_page.dart';

class Mainpage extends StatelessWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: const EdgeInsets.only(
          right: 25,
          left: 25,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Container(
                  width: _width,
                  height: _height * 0.185,
                  decoration: BoxDecoration(
                    color: lightGreen,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 15.0, top: 20),
                            child: Text(
                              "Travel at your own \n convenience",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Poppins-Regular',
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0, top: 13),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const BookingDetails(),
                                  ),
                                );
                              },
                              child: Container(
                                // height: 38,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: deepGreen,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "Book now",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontFamily: 'Poppins-Light'),
                                  )),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Lottie.asset("assets/lotties/travel.json"),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Moving today",
                    style: TextStyle(
                      fontFamily: 'Poppins-Bold',
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    children: const [
                      Text(
                        "See all",
                        style: TextStyle(
                          fontFamily: 'Poppins-Regular',
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.grey,
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: SizedBox(
                    height: 430,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: predefinedTripsData.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (_, index) => TicketMovingCard(
                        width: _width,
                        predefinedTrip: predefinedTripsData[index],
                      ),
                    )),
              ),
              // const AvailableBuses(),
            ],
          ),
        ),
      ),
    );
  }
}
