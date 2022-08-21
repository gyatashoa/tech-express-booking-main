import 'package:flutter/material.dart';

class BoughtTickets extends StatefulWidget {
  const BoughtTickets({Key? key}) : super(key: key);

  @override
  State<BoughtTickets> createState() => _BoughtTicketsState();
}

class _BoughtTicketsState extends State<BoughtTickets> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.height;
    return Container();
    // return Scaffold(
    //   backgroundColor: bgColor,
    //   body: Padding(
    //     padding: const EdgeInsets.only(
    //       right: 25,
    //       left: 25,
    //       top: 30,
    //     ),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         const Text(
    //           "Bought Tickets",
    //           style: TextStyle(
    //             fontFamily: 'Poppins-Bold',
    //             color: Colors.black,
    //             fontSize: 25,
    //           ),
    //         ),
    //         boughticket.isNotEmpty
    //             ? Expanded(
    //                 child: ListView.builder(
    //                   itemCount: boughticket.length,
    //                   itemBuilder: (context, index) => Padding(
    //                     padding: const EdgeInsets.all(8.0),
    //                     child: GestureDetector(
    //                       onTap: () {
    //                         Navigator.of(context).push(
    //                           MaterialPageRoute(
    //                             builder: (_) => const TripTicketPage(),
    //                           ),
    //                         );
    //                       },
    //                       child: Card(
    //                         elevation: 7.8,
    //                         shape: RoundedRectangleBorder(
    //                           borderRadius: BorderRadius.circular(10),
    //                         ),
    //                         child: Padding(
    //                           padding: const EdgeInsets.all(8.0),
    //                           child: Column(
    //                             crossAxisAlignment: CrossAxisAlignment.start,
    //                             children: [
    //                               const Text(
    //                                 "Bus Type: VVIP",
    //                                 style: TextStyle(
    //                                     fontFamily: 'Poppins-Regular',
    //                                     color: Colors.black,
    //                                     fontSize: 20),
    //                               ),
    //                               const SizedBox(height: 5),
    //                               Text(
    //                                 'Date : ${boughticket[index].ticketModel.date}',
    //                                 style: const TextStyle(
    //                                     color: Colors.black,
    //                                     fontFamily: 'Poppins-Bold',
    //                                     fontSize: 18),
    //                               ),
    //                               const SizedBox(height: 10),
    //                               Row(
    //                                 mainAxisAlignment:
    //                                     MainAxisAlignment.spaceBetween,
    //                                 children: [
    //                                   const Text(
    //                                     'Departs at',
    //                                     style: TextStyle(
    //                                         color: Colors.grey,
    //                                         fontFamily: 'Poppins-Regular',
    //                                         fontSize: 14),
    //                                   ),
    //                                   Text(
    //                                     '${boughticket[index].ticketModel.startTime}pm',
    //                                     style: const TextStyle(
    //                                         color: Colors.black,
    //                                         fontFamily: 'Poppins-Bold',
    //                                         fontSize: 18),
    //                                   ),
    //                                 ],
    //                               ),
    //                               const SizedBox(height: 20),
    //                               Container(
    //                                 padding: const EdgeInsets.only(
    //                                     top: 10, left: 10, right: 10),
    //                                 height: 100,
    //                                 width: _width,
    //                                 decoration: BoxDecoration(
    //                                   color: const Color(0xFFE4EDF0),
    //                                   borderRadius: BorderRadius.circular(8),
    //                                 ),
    //                                 child: const Center(
    //                                   child: Text(
    //                                     'barccodebarcodeb',
    //                                     style: TextStyle(
    //                                         fontFamily: 'Barcode',
    //                                         fontSize: 50,
    //                                         color: Colors.black),
    //                                   ),
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               )
    //             : const Padding(
    //                 padding: EdgeInsets.only(top: 50.0),
    //                 child: Center(
    //                   child: Text(
    //                     "No ticket bought yet",
    //                     style: TextStyle(
    //                         fontFamily: 'Poppins-Regular',
    //                         color: Colors.grey,
    //                         fontSize: 17),
    //                   ),
    //                 ),
    //               ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
