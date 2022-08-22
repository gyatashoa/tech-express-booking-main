import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../utils/constants.dart';
import 'homepage.dart';

class CompletePayment extends StatelessWidget {
  const CompletePayment({Key? key, required this.ticketId}) : super(key: key);
  final String ticketId;

  void _onViewQrCode(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: QrImage(
                data: ticketId,
                version: QrVersions.auto,
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/lotties/succ.json',
              ),
              const Text(
                "Payment Successfully Done",
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Poppins-Regular',
                    color: Color(0xFF005248),
                    fontSize: 18),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: GestureDetector(
                  onTap: () => _onViewQrCode(context),
                  child: Container(
                    height: 60,
                    width: 300,
                    decoration: BoxDecoration(
                      color: deepGreen,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        "View Payment QR Code",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: 'Poppins-Light'),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const Homepage()),
                      (_) => false),
                  child: Container(
                    height: 60,
                    width: 300,
                    decoration: BoxDecoration(
                      color: deepGreen,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "Get Back To Home Page",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: 'Poppins-Light'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
