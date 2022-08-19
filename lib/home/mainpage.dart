import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tech_express_app/home/trip_booking.dart';
import 'package:unicons/unicons.dart';

import '../utils/constants.dart';
import '../widget/appbar_card.dart';
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
          top: 30,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TicketAppBar(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
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
                                            const TripTicketPage(),),);
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
                      itemCount: listOfaviableTicket.length,
                      itemBuilder: (_, index) => TicketMovingCard(
                        width: _width,
                        ticketModel: listOfaviableTicket[index],
                      ),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Available buses",
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
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Container(
                  height: 150,
                  width: _width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              "assets/images/b1.png",
                              height: 60,
                              width: 60,
                            ),
                          ),
                          const Text(
                            "STC",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Poppins-Bold',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.redAccent,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'From',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: 'Poppins-Regular',
                                              fontSize: 12),
                                        ),
                                        Text(
                                          'Kumasi',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Poppins-Medium',
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: Colors.green,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'To',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: 'Poppins-Regular',
                                              fontSize: 12),
                                        ),
                                        Text(
                                          'Achimota',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Poppins-Medium',
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE4EDF0),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          UniconsLine.ticket,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 150,
                width: _width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            "assets/images/b4.png",
                            height: 60,
                            width: 60,
                          ),
                        ),
                        const Text(
                          "VVIP",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins-Bold',
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.redAccent,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'From',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: 'Poppins-Regular',
                                            fontSize: 12),
                                      ),
                                      Text(
                                        'Kumasi',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Poppins-Medium',
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: Colors.green,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'To',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: 'Poppins-Regular',
                                            fontSize: 12),
                                      ),
                                      Text(
                                        'Achimota',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Poppins-Medium',
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE4EDF0),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.airplane_ticket_outlined),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Container(
                  height: 150,
                  width: _width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              "assets/images/b5.png",
                              height: 60,
                              width: 60,
                            ),
                          ),
                          const Text(
                            "FORD",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Poppins-Bold',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.redAccent,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'From',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: 'Poppins-Regular',
                                              fontSize: 12),
                                        ),
                                        Text(
                                          'Kumasi',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Poppins-Medium',
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: Colors.green,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'To',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: 'Poppins-Regular',
                                              fontSize: 12),
                                        ),
                                        Text(
                                          'Achimota',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Poppins-Medium',
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE4EDF0),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.airplane_ticket_outlined),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 150,
                width: _width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            "assets/images/b1.png",
                            height: 60,
                            width: 60,
                          ),
                        ),
                        const Text(
                          "STC",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins-Bold',
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.redAccent,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'From',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: 'Poppins-Regular',
                                            fontSize: 12),
                                      ),
                                      Text(
                                        'Kumasi',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Poppins-Medium',
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: Colors.green,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'To',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: 'Poppins-Regular',
                                            fontSize: 12),
                                      ),
                                      Text(
                                        'Achimota',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Poppins-Medium',
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE4EDF0),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.airplane_ticket_outlined),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

