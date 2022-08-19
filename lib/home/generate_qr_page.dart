import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tech_express_app/utils/constants.dart';
class Generate_QR extends StatefulWidget {
  const Generate_QR({Key? key}) : super(key: key);

  @override
  State<Generate_QR> createState() => _Generate_QRState();
}

class _Generate_QRState extends State<Generate_QR> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: deepGreen,
      title: Text("Generate Payment Qr Code", style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                QrImage(
                  data: controller.text,
                  size: 200,
                ),
                SizedBox(height: 40,),
                buildTextField(context),
              ]
            ),
          ),
        ),
      ),
    );
  }
  Widget buildTextField(BuildContext context) => TextField(
    controller: controller,
    style: TextStyle(
      color: deepGreen,
      fontFamily: 'Poppins-Medium'
    ),
    decoration: InputDecoration(
      hintText: 'Enter Payment Data',
      hintStyle: TextStyle(color: deepGreen),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: deepGreen),
      ),
      suffixIcon: IconButton(onPressed: () => setState(() {

      }), icon: Icon(Icons.done, color: deepGreen,))
    ),
  );
}
