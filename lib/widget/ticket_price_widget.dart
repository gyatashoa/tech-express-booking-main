import 'package:flutter/material.dart';

class TicketPriceWidget extends StatelessWidget {
  const TicketPriceWidget({Key? key, required this.total}) : super(key: key);
  final double total;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: 100,
          width: _width,
          decoration: const BoxDecoration(
            color: Color(0xFFE4EDF0),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/pngs/qr.png'),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Ticket price",
                        style: TextStyle(
                            fontFamily: 'Poppins-Regular',
                            color: Colors.black,
                            fontSize: 18),
                      ),
                      Text(
                        "GHS $total",
                        style: const TextStyle(
                            fontFamily: 'Poppins-Bold',
                            color: Colors.black,
                            fontSize: 22),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
            padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
            height: 100,
            width: _width,
            decoration: BoxDecoration(
              color: const Color(0xFFE4EDF0),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                'barccodebarcodeb',
                style: TextStyle(
                    fontFamily: 'Barcode', fontSize: 50, color: Colors.black),
              ),
            )),
      ],
    );
  }
}
