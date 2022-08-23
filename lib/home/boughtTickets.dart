import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tech_express_app/Models/ticket_model.dart';
import 'package:tech_express_app/service/cloud_firestore_service.dart';
import 'package:tech_express_app/widget/ticket_card.dart';

import '../utils/constants.dart';
import 'trips/trip_ticket_page.dart';

class BoughtTickets extends StatefulWidget {
  const BoughtTickets({Key? key}) : super(key: key);

  @override
  State<BoughtTickets> createState() => _BoughtTicketsState();
}

class _BoughtTicketsState extends State<BoughtTickets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: const EdgeInsets.only(
          right: 25,
          left: 25,
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Bought Tickets",
              style: TextStyle(
                fontFamily: 'Poppins-Bold',
                color: Colors.black,
                fontSize: 25,
              ),
            ),
            StreamBuilder<QuerySnapshot<TicketModel>>(
                stream: CloudFirestoreService.instance.getTickets(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Error');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Expanded(
                      child: Center(
                          child: Lottie.asset('assets/lotties/loading.json')),
                    );
                  }
                  if (snapshot.hasData) {
                    if (snapshot.data!.docs.isEmpty) {
                      return Center(
                        child: Column(
                          children: [
                            Lottie.asset('assets/lotties/empty_box.json'),
                            const Text('You have no bought tickets'),
                          ],
                        ),
                      );
                    }
                    final docs =
                        snapshot.data!.docs.map((e) => e.data()).toList();
                    docs.sort(((a, b) => b.createdAt.compareTo(a.createdAt)));
                    return Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: docs.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TicketCard(
                            ticketModel: docs[index],
                          ),
                        ),
                      ),
                    );
                  }
                  return Container();
                })
          ],
        ),
      ),
    );
  }
}
