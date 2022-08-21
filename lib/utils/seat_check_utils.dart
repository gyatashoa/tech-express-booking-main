import 'package:flutter/material.dart';

class SeatCheckWidget extends StatelessWidget {
  const SeatCheckWidget(
      {Key? key, required this.isLoading, required this.isSeatAvailable})
      : super(key: key);
  final bool isLoading;
  final bool? isSeatAvailable;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: CircularProgressIndicator(
          color: Colors.green,
        ),
      );
    }
    if (isSeatAvailable == null) {
      return Image.asset(
        'assets/pngs/seat.png',
        color: const Color(0xFF005248),
        height: 10,
        width: 10,
      );
    }
    if (isSeatAvailable!) {
      return const Icon(
        Icons.check,
        color: Colors.green,
      );
    }
    if (!(isSeatAvailable!)) {
      return const Icon(
        Icons.error,
        color: Colors.red,
      );
    }
    return Container();
  }
}
