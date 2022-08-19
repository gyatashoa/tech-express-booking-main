import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_express_app/widget/ticketmovincard.dart';

import '../utils/constants.dart';
import 'payment_platform.dart';

class BookingDetails extends StatefulWidget {
  final TicketModel ticketModel;
  const BookingDetails({Key? key, required this.ticketModel}) : super(key: key);

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  final bookSeat = TextEditingController();
  int currentIndex = 0;

  double total = 50.0;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 35,
          vertical: 40,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Icon(CupertinoIcons.arrow_left,
                              color: Colors.grey),
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      }),
                  const Padding(
                    padding: EdgeInsets.only(left: 95.0),
                    child: Text(
                      "Parchase Trip",
                      style: TextStyle(
                        fontFamily: 'Poppins-Bold',
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
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
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'From',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: 'Poppins-Regular',
                                            fontSize: 14),
                                      ),
                                      Text(
                                        widget.ticketModel.from,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Poppins-Medium',
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
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
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'To',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: 'Poppins-Regular',
                                            fontSize: 14),
                                      ),
                                      Text(
                                        widget.ticketModel.to,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Poppins-Medium',
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE4EDF0),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(
                        'assets/pngs/updown.png',
                        color: const Color(0xFF005248),
                        height: 10,
                        width: 10,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Divider(
                  thickness: 0.3,
                  color: Colors.grey,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Date",
                        style: TextStyle(
                            fontFamily: 'Poppins-Regular',
                            color: Colors.grey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.ticketModel.date,
                        style: const TextStyle(
                            fontFamily: 'Poppins-Regular',
                            color: Colors.black,
                            fontSize: 18),
                      ),
                    ],
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE4EDF0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      'assets/pngs/cal.png',
                      color: const Color(0xFF005248),
                      height: 10,
                      width: 10,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Divider(
                  thickness: 0.3,
                  color: Colors.grey,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Arrival - Departure time",
                        style: TextStyle(
                            fontFamily: 'Poppins-Regular',
                            color: Colors.grey,
                            fontSize: 13),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "${widget.ticketModel.startTime}am - ${widget.ticketModel.endtime}pm",
                        style: const TextStyle(
                            fontFamily: 'Poppins-Regular',
                            color: Colors.black,
                            fontSize: 18),
                      ),
                    ],
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE4EDF0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      'assets/pngs/clock.png',
                      color: const Color(0xFF005248),
                      height: 10,
                      width: 10,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Divider(
                  thickness: 0.3,
                  color: Colors.grey,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Choose comfort",
                        style: TextStyle(
                            fontFamily: 'Poppins-Regular',
                            color: Colors.grey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "VVIP",
                              style: TextStyle(
                                  fontFamily: 'Poppins-Regular',
                                  color: Colors.black,
                                  fontSize: 18),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "STC",
                                style: TextStyle(
                                    fontFamily: 'Poppins-Regular',
                                    color: Colors.black,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Container(
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(
                                color: const Color(0xFFE4EDF0),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Center(
                                child: Text(
                                  "Ford",
                                  style: TextStyle(
                                      fontFamily: 'Poppins-Regular',
                                      color: Color(0xFF005248),
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "VIP",
                              style: TextStyle(
                                  fontFamily: 'Poppins-Regular',
                                  color: Colors.black,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Divider(
                  thickness: 0.3,
                  color: Colors.grey,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Select you seat",
                        style: TextStyle(
                            fontFamily: 'Poppins-Regular',
                            color: Colors.grey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width - 110,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextFormField(
                          controller: bookSeat,
                          textInputAction: TextInputAction.none,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: "No seat selected",
                            hintStyle: TextStyle(
                              color: Colors.black26,
                              fontSize: 16,
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE4EDF0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      'assets/pngs/seat.png',
                      color: const Color(0xFF005248),
                      height: 10,
                      width: 10,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Divider(
                  thickness: 0.3,
                  color: Colors.grey,
                ),
              ),
              Container(
                height: 100,
                width: _width,
                decoration: const BoxDecoration(
                  color: Color(0xFFE4EDF0),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/pngs/qr.png'),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Ticket price",
                              style: TextStyle(
                                  fontFamily: 'Poppins-Regular',
                                  color: Colors.black,
                                  fontSize: 18),
                            ),
                            Text(
                              "GHS ${widget.ticketModel.price}",
                              style: const TextStyle(
                                  fontFamily: 'Poppins-Bold',
                                  color: Colors.black,
                                  fontSize: 22),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  height: 100,
                  width: _width,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE4EDF0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      'barccodebarcodeb',
                      style: TextStyle(
                          fontFamily: 'Barcode',
                          fontSize: 50,
                          color: Colors.black),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 35),
                child: GestureDetector(
                  onTap: () => _settingModalBottomSheet(context),
                  child: Container(
                    height: 48,
                    width: 250,
                    decoration: BoxDecoration(
                      color: deepGreen,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "Purchase ticket",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: 'Poppins-Light'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            color: const Color(0xFFE4EDF0),
            child: Wrap(
              children: [
                ListTile(
                  leading: const Icon(Icons.mobile_friendly),
                  title: const Text("Mobile Money"),
                  subtitle:
                      const Text("MTN Momo / Voda Cash / AirtelTigo Cash"),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const MomoCardPayment(),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.payment_outlined),
                  title: const Text("Credit Card"),
                  subtitle: const Text("Visa / Master"),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const CreditCardPay(),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
