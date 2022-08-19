// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_express_app/authentication/login_page.dart';
import 'package:tech_express_app/authentication/userCredential.dart';
import 'package:tech_express_app/home/homepage.dart';

import '../utils/constants.dart';
import '../widget/authWedget.dart';

class Signup_Screen extends StatefulWidget {
  const Signup_Screen({Key? key}) : super(key: key);

  @override
  State<Signup_Screen> createState() => _Signup_ScreenState();
}

class _Signup_ScreenState extends State<Signup_Screen> {

  final keyForm = GlobalKey<FormState>();

  bool isLoading = false;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: bgColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 120,
                width: _width,
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(150)),
                ),
                child: ClipRRect(
                  child: Image.asset(
                    'assets/pngs/Linth.png',
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(150)),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30, top: 30),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      fontFamily: 'Poppins-Bold',
                      color: deepGreen,
                      fontSize: 26),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
                child: SizedBox(
                  child: Form(
                    key: keyForm,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Name",
                          style: TextStyle(
                              fontFamily: 'Poppins-Medium',
                              color: Colors.black54,
                              fontSize: 18),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        buildTextField(
                          context,
                          nameController,
                          CupertinoIcons.person,
                          "User Name",
                          false,
                          false,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Email",
                          style: TextStyle(
                              fontFamily: 'Poppins-Medium',
                              color: Colors.black54,
                              fontSize: 18),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        buildTextField(
                          context,
                          emailController,
                          CupertinoIcons.mail,
                          "email",
                          false,
                          true,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Phone number",
                          style: TextStyle(
                              fontFamily: 'Poppins-Medium',
                              color: Colors.black54,
                              fontSize: 18),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        buildTextField(
                          context,
                          mobileController,
                          CupertinoIcons.phone,
                          "mobile number",
                          false,
                          false,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Password",
                          style: TextStyle(
                              fontFamily: 'Poppins-Medium',
                              color: Colors.black54,
                              fontSize: 18),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        buildTextField(
                          context,
                          passController,
                          CupertinoIcons.lock_circle,
                          "password",
                          true,
                          false,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: RichText(
                            text: const TextSpan(
                                text: "by pressing 'Sign Up' you agree to our ",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                                children: [
                                  TextSpan(
                                    text: "terms & conditions",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Roboto Thin',
                                        color: deepGreen),
                                  ),
                                ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 50.0),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                Auth().SignUpAuth(
                                    context,
                                    keyForm,
                                    nameController.text,
                                    emailController.text,
                                    mobileController.text,
                                    passController.text);
                              },
                              child: Container(
                                height: 60,
                                width: 200,
                                decoration: BoxDecoration(
                                  color: deepGreen,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                        color: deepGreen.withOpacity(0.1),
                                        blurRadius: 10,
                                        spreadRadius: 3),
                                  ],
                                ),
                                child: const Center(
                                    child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontFamily: 'Poppins-Light'),
                                )),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: Row(
                            children: [
                              const Text(
                                'Have an account?',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontFamily: 'Poppins-Regular'),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginPage()));
                                  },
                                  child: const Text(
                                    'Log In',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: deepGreen,
                                        fontFamily: 'Poppins-Bold'),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
