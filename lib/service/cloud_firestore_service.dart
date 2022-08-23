import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tech_express_app/service/sms_api_service.dart';
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
      SmsApiService.instance.sendSmsToUser(
          phoneNumber: ticketModel.phoneNumber,
          name: ticketModel.userName,
          ticketId: ticketModel.id,
          price: ticketModel.price);
    } on Exception {
      return 'Error booking ticket';
    }
  }

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
