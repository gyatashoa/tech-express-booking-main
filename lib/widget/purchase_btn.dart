import 'package:flutter/material.dart';
import '../utils/constants.dart';

class PurchaseBtn extends StatelessWidget {
  const PurchaseBtn({Key? key, required this.callback}) : super(key: key);
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 35),
      child: GestureDetector(
        onTap: callback,
        child: Center(
          child: Container(
            height: 48,
            width: 230,
            decoration: BoxDecoration(
              color: deepGreen,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                "Purchase ticket",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontFamily: 'Poppins-Light'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
