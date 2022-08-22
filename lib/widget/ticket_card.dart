import 'package:flutter/material.dart';
import 'package:tech_express_app/Models/ticket_model.dart';
import 'package:tech_express_app/home/trips/trip_ticket_page.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({Key? key, required this.ticketModel}) : super(key: key);
  final TicketModel ticketModel;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => TripTicketPage(
                    ticketModel: ticketModel,
                  ))),
      child: Card(
        elevation: 7.8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bus Type: ${ticketModel.busType.name}",
                style: const TextStyle(
                    fontFamily: 'Poppins-Regular',
                    color: Colors.black,
                    fontSize: 20),
              ),
              const SizedBox(height: 5),
              Text(
                'Date : ${ticketModel.date.getDate}',
                style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins-Bold',
                    fontSize: 18),
              ),
              const SizedBox(height: 10),
              Row(
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
                    ticketModel.arrivalDepTime.split('-').last.trim(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins-Bold',
                        fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                height: 100,
                width: _width,
                decoration: BoxDecoration(
                  color: const Color(0xFFE4EDF0),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    ticketModel.id.substring(0, 16),
                    style: const TextStyle(
                        fontFamily: 'Barcode',
                        fontSize: 50,
                        color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension on DateTime {
  String get getDate => '$day/${month < 10 ? '0$month' : month}/$year';
}
