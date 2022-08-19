import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tech_express_app/authentication/login_page.dart';
import 'package:tech_express_app/authentication/sign_up.dart';
import 'package:tech_express_app/utils/constants.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: devSize.height * .6,
                child: Lottie.asset('assets/lotties/lott2.json')),
            const Text(
              "Booking a bus ticket for your \njourneys just got easier",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Poppins-Bold',
                  color: Colors.black,
                  fontSize: 22),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Book your ticket for a long journey in the \ncomfort of your home, anytime, \nanywhere, anyday",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Poppins-Regular',
                  color: Colors.grey,
                  fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                child: Container(
                  height: 70,
                  width: 350,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE4EDF0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Signup_Screen(),
                            ),
                          );
                        },
                        child: Container(
                          height: 70,
                          width: 180,
                          decoration: BoxDecoration(
                            color: deepGreen,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontFamily: 'Poppins-Regular',
                                  color: Colors.white,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 40.0),
                        child: Center(
                          child: Text(
                            'Log In',
                            style: TextStyle(
                                fontFamily: 'Poppins-Medium',
                                color: deepGreen,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
