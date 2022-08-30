import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tech_express_app/Models/bus_type.dart';
import 'package:tech_express_app/service/sms_api_service.dart';

import '../Models/ticket_model.dart';

class CloudFirestoreService {
  late FirebaseFirestore _firestore;
  static final CloudFirestoreService instance = CloudFirestoreService._();
  CloudFirestoreService._() {
    _firestore = FirebaseFirestore.instance;
  }

  final ticketsCollection = 'Tickets';

  Future bookTicket(TicketModel ticketModel) async {
    try {
      await _firestore
          .collection(ticketsCollection)
          .doc(ticketModel.id)
          .set(ticketModel.toJson());
      SmsApiService.instance.sendSmsToUser(
          phoneNumber: ticketModel.phoneNumber,
          name: ticketModel.userName,
          ticketId: ticketModel.id,
          price: ticketModel.price);
    } on Exception {
      return 'Error booking ticket';
    }
  }

  Stream<QuerySnapshot<TicketModel>> getOccupiedSeats(BusType busType,
      String to, String from, String arrivalTime, DateTime date) async* {
    var snap = _firestore
        .collection(ticketsCollection)
        .where('busType', isEqualTo: busType.index)
        .where('to', isEqualTo: to)
        .where('from', isEqualTo: from)
        .where('arrivalDepTime', isEqualTo: arrivalTime)
        .withConverter<TicketModel>(
            fromFirestore: (docs, _) => TicketModel.fromJson({
                  ...docs.data()!,
                }),
            toFirestore: ((value, options) => value.toJson()))
        .snapshots();
    yield* snap;
  }

  // Future checkForSeatAvailability(int seatNumber, BusType busType, String? to,
  //     String? from, String? arrivalTime, DateTime date) async {
  //   if (to == null) return 'Please select a location';
  //   if (from == null) return 'Please select a destination';
  //   if (arrivalTime == null) return 'Please select an arrival - departure time';
  //   try {
  //     var res = await _firestore
  //         .collection(ticketsCollection)
  //         .where('busType', isEqualTo: busType.index)
  //         .where('seatNumber', isEqualTo: seatNumber)
  //         .where('to', isEqualTo: to)
  //         .where('from', isEqualTo: from)
  //         .where('arrivalDepTime', isEqualTo: arrivalTime)
  //         .withConverter<TicketModel>(
  //             fromFirestore: (docs, _) => TicketModel.fromJson({
  //                   ...docs.data()!,
  //                 }),
  //             toFirestore: ((value, options) => value.toJson()))
  //         .get();
  //     bool found = res.docs.any((element) => element.data().date.isEqual(date));
  //     if (found) {
  //       return false;
  //     }
  //     if (res.docs.isEmpty) {
  //       return true;
  //     }
  //     return false;
  //   } on Exception {
  //     return 'Error checking for seat avilability';
  //   }
  // }

  Stream<QuerySnapshot<TicketModel>> getTickets() async* {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    var res = await _firestore
        .collection(ticketsCollection)
        .where('userId', isEqualTo: uid)
        .withConverter<TicketModel>(
            fromFirestore: (docs, _) => TicketModel.fromJson({
                  ...docs.data()!,
                }),
            toFirestore: ((value, options) => value.toJson()))
        .snapshots();
    yield* res;
  }
}

extension on DateTime {
  bool isEqual(DateTime other) =>
      (day == other.day) && (month == other.month) && (year == other.year);
}
