import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:tech_express_app/Models/bus_type.dart';
import 'package:tech_express_app/Models/ticket_model.dart';
import 'package:tech_express_app/service/cloud_firestore_service.dart';

class SeatDialog extends StatelessWidget {
  final DateTime selectedDate;
  final String to;
  final String from;
  final BusType busType;
  final String arrivalTime;
  const SeatDialog({
    Key? key,
    required this.selectedDate,
    required this.to,
    required this.from,
    required this.busType,
    required this.arrivalTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Available Seats'),
      content: StreamBuilder<QuerySnapshot<TicketModel>>(
          stream: CloudFirestoreService.instance
              .getOccupiedSeats(busType, to, from, arrivalTime, selectedDate),
          builder: (_, model) {
            if (model.connectionState == ConnectionState.waiting) {
              return Lottie.asset('assets/lotties/loading_1.json');
            }
            if (model.hasError) {
              return const Text('Error Loading Seats');
            }
            if (model.hasData && model.data != null) {
              var docs = model.data!.docs.map((e) => e.data()).toList();
              List<int> occupiedSeats = seatsByDate(docs, selectedDate);
              return Scrollbar(
                thickness: 1.8,
                child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: busType.maxCapacity,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemBuilder: (_, i) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              bool selected = occupiedSeats.contains(i + 1);
                              if (selected) {
                                Fluttertoast.showToast(
                                    msg:
                                        "Please seat has already been selected",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    // backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                return;
                              }

                              Navigator.pop(context, i + 1);
                            },
                            child: CircleAvatar(
                              child: Stack(
                                children: [
                                  Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: CircleAvatar(
                                          backgroundColor:
                                              Colors.green.shade700,
                                          radius: 10,
                                          child: Text('${i + 1}'))),
                                  const Center(
                                      child: Icon(Icons.event_seat_sharp)),
                                ],
                              ),
                              // child:
                              backgroundColor: occupiedSeats.contains(i + 1)
                                  ? Colors.red
                                  : Colors.green,
                            ),
                          ),
                        )),
              );
              // return Container();
            }

            return Container();
          }),
    );
  }
}

List<int> seatsByDate(List<TicketModel> tickets, DateTime selectedDate) =>
    tickets
        .where((element) => element.date.isEqual(selectedDate))
        .map((e) => e.seatNumber)
        .toList();

extension on DateTime {
  bool isEqual(DateTime other) =>
      (day == other.day) && (month == other.month) && (year == other.year);
}
