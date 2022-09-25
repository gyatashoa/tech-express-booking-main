import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
    final devSize = MediaQuery.of(context).size;
    return AlertDialog(
      title: Column(
        children: [
          const Text('Available Seats'),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  CircleAvatar(
                    radius: 7,
                    backgroundColor: Colors.green,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    'Available seats',
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
              Row(
                children: const [
                  CircleAvatar(
                    radius: 7,
                    backgroundColor: Colors.red,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    'Occupied seats',
                    style: TextStyle(fontSize: 12),
                  )
                ],
              )
            ],
          )
        ],
      ),
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
              // return Container();

              return SizedBox(
                height: devSize.height * .7,
                width: devSize.width,
                child: Scrollbar(
                  thickness: 1.8,
                  child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: busType.maxCapacity,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          // crossAxisSpacing: 20,
                          // mainAxisSpacing: 6,
                          crossAxisCount: busType.crossAxisCount),
                      itemBuilder: (_, i) => Builder(builder: (context) {
                            return _SeatWidget(
                                busType: busType,
                                occupiedSeats: occupiedSeats,
                                i: i);
                          })),
                ),
              );
              // return Container();
            }

            return Container();
          }),
    );
  }
}

class _SeatWidget extends StatelessWidget {
  const _SeatWidget(
      {super.key,
      required this.occupiedSeats,
      required this.i,
      required this.busType});
  final List<int> occupiedSeats;
  final int i;
  final BusType busType;

  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        bool selected = occupiedSeats.contains(i + 1);
        if (selected) {
          Fluttertoast.showToast(
              msg: "Please seat has already been selected",
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
      // child: Padding(
      // padding: EdgeInsets.only(left: (i + 1) % 3 == 0 ? 20 : 0),
      child: Builder(builder: (context) {
        if (busType == BusType.STC || busType == BusType.VIP) {
          return Row(
            children: [
              SizedBox(
                width: (i + 1) % 3 == 0 ? devSize.width * 0.05 : 0,

                // child: Divider(),
              ),
              Container(
                height: double.infinity,
                width: devSize.width * 0.15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      occupiedSeats.contains(i + 1) ? Colors.red : Colors.green,
                ),
                child: Stack(
                  children: [
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                            backgroundColor: Colors.green.shade700,
                            radius: 10,
                            child: Text('${i + 1}'))),
                    const Center(
                        child: Icon(
                      Icons.event_seat_sharp,
                      color: Colors.white,
                    )),
                  ],
                ),
                // child:
              ),
            ],
          );
        }
        if (busType == BusType.VVIP || busType == BusType.FORD) {
          return Row(
            children: [
              SizedBox(
                width: (i + 1).isIn ? devSize.width * 0.04 : 0,
                // child: Divider(),
              ),
              Container(
                height: double.infinity,
                width: devSize.width * 0.12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      occupiedSeats.contains(i + 1) ? Colors.red : Colors.green,
                ),
                child: Stack(
                  children: [
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                            backgroundColor: Colors.green.shade700,
                            radius: 10,
                            child: Text('${i + 1}'))),
                    const Center(
                        child: Icon(
                      Icons.event_seat_sharp,
                      color: Colors.white,
                    )),
                  ],
                ),
                // child:
              ),
              // SizedBox(
              //   width: (i + 1).isInEven ? devSize.width * 0.04 : 0,
              //   // child: Divider(),
              // ),
            ],
          );
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

extension on int {
  List<T> map<T extends Widget>(T Function(int i) func) {
    List<T> items = [];
    for (int i = 0; i < this; i++) {
      items.add(func(i));
    }
    return items;
  }

  bool get isIn {
    switch (this) {
      case 3:
        return true;

      case 7:
        return true;

      case 11:
        return true;

      case 15:
        return true;

      case 19:
        return true;

      case 23:
        return true;
      case 27:
        return true;

      case 31:
        return true;

      case 35:
        return true;

      case 39:
        return true;

      case 43:
        return true;
      default:
    }
    return false;
  }

  bool get isInEven {
    switch (this) {
      case 2:
        return true;

      case 6:
        return true;

      case 10:
        return true;

      case 14:
        return true;

      case 18:
        return true;

      case 22:
        return true;
      case 26:
        return true;

      case 30:
        return true;

      case 34:
        return true;

      case 38:
        return true;

      case 42:
        return true;
      default:
    }
    return false;
  }
}
