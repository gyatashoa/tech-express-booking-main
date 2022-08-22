import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

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
    } on Exception {
      return 'Error booking ticket';
    }
  }

  Future getTickets() async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      var res = await _firestore
          .collection(ticketsCollection)
          .where('id', isEqualTo: uid)
          .withConverter<TicketModel>(
              fromFirestore: (docs, _) => TicketModel.fromJson({
                    ...docs.data()!,
                  }),
              toFirestore: ((value, options) => value.toJson()))
          .get();
      return res.docs.map((e) => e.data()).toList();
    } on Exception {
      return 'Error booking ticket';
    }
  }
}
