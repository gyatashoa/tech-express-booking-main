import 'package:flutter/material.dart';
import 'package:tech_express_app/Models/ticket_model.dart';
import 'package:tech_express_app/widget/pin_dialog.dart';

import '../utils/constants.dart';

class MomoCardWidget extends StatefulWidget {
  const MomoCardWidget(
      {Key? key,
      required this.name,
      required this.ticketModel,
      required this.exampleNumber})
      : super(key: key);
  final TicketModel ticketModel;
  final String exampleNumber;
  final String name;
  @override
  State<MomoCardWidget> createState() => _MomoCardWidgetState();
}

class _MomoCardWidgetState extends State<MomoCardWidget> {
  late TextEditingController textEditingController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController(text: '');
    _formKey = GlobalKey<FormState>();
  }

  Future<void> showPinDialog() async {
    if (_formKey.currentState!.validate()) {
      return showDialog(
          context: context,
          builder: (_) => PinDialog(
                ticketModel: widget.ticketModel,
              ));
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 1),
        content: Row(
          children: const [
            Icon(
              Icons.error,
              color: Colors.red,
            ),
            Text('Please enter a valid number')
          ],
        )));
  }

  String? _onValidatePhoneNumber(String? phoneNumber) {
    String msg = 'Enter a valid phone number';
    if (phoneNumber == null) return msg;
    Pattern pattern = r'^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$';
    RegExp regExp = RegExp(pattern.toString());
    if (!regExp.hasMatch(phoneNumber)) return msg;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 5.9,
        child: ExpansionTile(
          textColor: Colors.black,
          title: Text(widget.name),
          leading: null,
          childrenPadding: const EdgeInsets.all(10.0),
          children: [
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  controller: textEditingController,
                  textInputAction: TextInputAction.none,
                  keyboardType: TextInputType.phone,
                  cursorColor: Colors.black,
                  validator: _onValidatePhoneNumber,
                  decoration: InputDecoration(
                    hintText: widget.exampleNumber,
                    hintStyle: const TextStyle(
                      color: Colors.black26,
                      fontSize: 16,
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: GestureDetector(
                onTap: showPinDialog,
                child: Container(
                  height: 60,
                  width: 300,
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
          ],
        ),
      ),
    );
  }
}
