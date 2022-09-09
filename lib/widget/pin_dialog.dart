import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tech_express_app/Models/ticket_model.dart';
import 'package:tech_express_app/service/cloud_firestore_service.dart';
import 'package:tech_express_app/utils/constants.dart';
import 'package:tech_express_app/utils/show_error_snackbar.dart';

import '../home/complete_pay.dart';

class PinDialog extends StatefulWidget {
  const PinDialog({Key? key, required this.ticketModel}) : super(key: key);
  final TicketModel ticketModel;

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
      var res =
          await CloudFirestoreService.instance.bookTicket(widget.ticketModel);
      setState(() {
        _isLoading = false;
      });
      if (res is String) {
        showErrorSnackbar(context, res);
        return;
      }
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => CompletePayment(
            ticketId: widget.ticketModel.id,
          ),
        ),
      );
      return;
    }
    showErrorSnackbar(context, 'Please enter a valid pin');
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
        TextButton(
          onPressed: _onConfirmPin,
          child: _isLoading
              ? const CircularProgressIndicator(
                  color: deepGreen,
                )
              : const Text(
                  'Send Code',
                  style: TextStyle(
                    color: Color(0xFF6200EE),
                  ),
                ),
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
