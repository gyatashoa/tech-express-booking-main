import 'package:flutter/material.dart';
import 'package:tech_express_app/Models/ticket_model.dart';
import '../home/payment_platform.dart';

class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget({Key? key, required this.ticketModel})
      : super(key: key);
  final TicketModel ticketModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFE4EDF0),
      child: Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.mobile_friendly),
            title: const Text("Mobile Money"),
            subtitle: const Text("MTN Momo / Voda Cash / AirtelTigo Cash"),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => MomoCardPayment(
                  ticketModel: ticketModel,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.payment_outlined),
            title: const Text("Credit Card"),
            subtitle: const Text("Visa / Master"),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => CreditCardPay(
                  ticketModel: ticketModel,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
