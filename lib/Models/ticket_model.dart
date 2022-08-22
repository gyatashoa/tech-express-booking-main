import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tech_express_app/Models/bus_type.dart';

class TicketModel {
  final String id;
  final String userId;
  final String userName;
  final BusType busType;
  final String arrivalDepTime;
  final DateTime date;
  final double price;
  final String to;
  final String from;
  final int seatNumber;
  final DateTime createdAt;

  TicketModel(
      {required this.id,
      required this.userId,
      required this.userName,
      required this.busType,
      required this.arrivalDepTime,
      required this.date,
      required this.price,
      required this.to,
      required this.from,
      required this.seatNumber,
      required this.createdAt});

  TicketModel.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        userId = data['userId'],
        userName = data['userName'],
        busType = _getBusType(data['busType']),
        arrivalDepTime = data['arrivalDepTime'],
        date = (data['date'] as Timestamp).toDate(),
        price = (data['price']),
        to = (data['to']),
        from = (data['from']),
        seatNumber = (data['seatNumber']),
        createdAt = (data['date'] as Timestamp).toDate();

  static BusType _getBusType(int index) => BusType.values[index];

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'userId': userId,
        'busType': busType.index,
        'arrivalDepTime': arrivalDepTime,
        'date': Timestamp.fromDate(date),
        'price': price,
        'to': to,
        'from': from,
        'seatNumber': seatNumber,
        'createdAt': FieldValue.serverTimestamp()
      };
}
