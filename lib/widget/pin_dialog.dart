import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tech_express_app/utils/constants.dart';

import '../home/complete_pay.dart';

class PinDialog extends StatefulWidget {
  const PinDialog({Key? key}) : super(key: key);

  @override
  State<PinDialog> createState() => _PinDialogState();
}

class _PinDialogState extends State<PinDialog> {
  late GlobalKey<FormState> _formKey;
  late bool _isLoading;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _isLoading = false;
  }

  Future<void> _onConfirmPin() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      //TODO Add ticket to db
      await Future.delayed(const Duration(seconds: 2));
      //TODO Send sms here
      setState(() {
        _isLoading = false;
      });
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const CompletePayment(),
        ),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 1),
        content: Row(
          children: const [
            Icon(
              Icons.error,
              color: Colors.red,
            ),
            Text('Please enter a valid pin')
          ],
        )));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Enter your pin'),
      content: Form(
        key: _formKey,
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
          onPressed: _onConfirmPin,
          child: _isLoading
              ? const CircularProgressIndicator(
                  color: deepGreen,
                )
              : const Text('Send Code'),
        ),
      ],
    );
  }
}

class _OptCodeField extends StatelessWidget {
  const _OptCodeField({Key? key}) : super(key: key);

  String? _onValidateNumber(String? pin) {
    if (pin == null) return '';
    if (int.tryParse(pin) == null) return '';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: Colors.blueGrey[100], borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        validator: _onValidateNumber,
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
