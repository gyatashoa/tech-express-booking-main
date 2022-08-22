import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../home/complete_pay.dart';

class PinDialog extends StatelessWidget {
  const PinDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Enter your pin'),
      content: Form(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            _OptCodeField(),
            _OptCodeField(),
            _OptCodeField(),
            _OptCodeField(),
          ],
        ),
      ),
      actions: [
        FlatButton(
          textColor: const Color(0xFF6200EE),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => const CompletePayment(),
              ),
            );
          },
          child: const Text('Send Code'),
        ),
      ],
    );
  }
}

class _OptCodeField extends StatelessWidget {
  const _OptCodeField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: Colors.blueGrey[100], borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        onChanged: ((value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        }),
        style: Theme.of(context).textTheme.headline6,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
