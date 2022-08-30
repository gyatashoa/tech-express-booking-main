import 'package:flutter/material.dart';

class SeatCheckWidget extends StatelessWidget {
  const SeatCheckWidget({Key? key, required this.onTap}) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        'assets/pngs/seat.png',
        color: const Color(0xFF005248),
        height: 10,
        width: 10,
      ),
    );
  }
}
