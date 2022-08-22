import 'package:flutter/material.dart';
import 'package:tech_express_app/Models/ticket_model.dart';
import 'package:tech_express_app/utils/constants.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:tech_express_app/widget/momo_card_widget.dart';

import 'complete_pay.dart';

//Credit Card
class CreditCardPay extends StatefulWidget {
  const CreditCardPay({Key? key}) : super(key: key);

  @override
  State<CreditCardPay> createState() => _CreditCardPayState();
}

class _CreditCardPayState extends State<CreditCardPay> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Credit Card Payment'),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CreditCardWidget(
                cardBgColor: Colors.greenAccent,
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                obscureCardNumber: true,
                obscureCardCvv: true,
                onCreditCardWidgetChange: (CreditCardBrand) {},
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CreditCardForm(
                      formKey: formKey,
                      onCreditCardModelChange: onCreditCardModelChange,
                      obscureCvv: true,
                      obscureNumber: true,
                      cardNumberDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Number',
                        hintText: 'XXXX XXXX XXXX XXXX',
                      ),
                      expiryDateDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Expired Date',
                        hintText: 'XX/XX',
                      ),
                      cvvCodeDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'CVV',
                        hintText: 'XXX',
                      ),
                      cardHolderDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Card Holder Name',
                      ),
                      cardHolderName: cardHolderName,
                      cardNumber: cardNumber,
                      cvvCode: cvvCode,
                      expiryDate: expiryDate,
                      themeColor: Colors.black,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, top: 20, right: 20),
                      child: GestureDetector(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (_) => const CompletePayment(
                                  ticketId: 'dssfdf',
                                ),
                              ),
                            );
                          }
                        },
                        child: Container(
                          height: 60,
                          width: 250,
                          decoration: BoxDecoration(
                            color: deepGreen,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Text(
                              "Pay Now",
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
          ],
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}

/*






  Momo card payment page







*/
class MomoCardPayment extends StatefulWidget {
  const MomoCardPayment({Key? key, required this.ticketModel})
      : super(key: key);
  final TicketModel ticketModel;
  @override
  State<MomoCardPayment> createState() => _MomoCardPaymentState();
}

class _MomoCardPaymentState extends State<MomoCardPayment> {
  final numberField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Money Payment'),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  "Total: Ghs ${widget.ticketModel.price}",
                  style: const TextStyle(
                      fontFamily: 'Poppins-Regular',
                      color: Colors.black,
                      fontSize: 20),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Bar Code",
                  style: TextStyle(
                      fontFamily: 'Poppins-Regular',
                      color: Colors.grey,
                      fontSize: 15),
                ),
                Container(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    height: 100,
                    width: _width,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE4EDF0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        'barccodebarcodeb',
                        style: TextStyle(
                            fontFamily: 'Barcode',
                            fontSize: 50,
                            color: Colors.black),
                      ),
                    )),
                const SizedBox(height: 50),
                const MomoCardWidget(
                    name: "MTN MOMO", exampleNumber: "eg : 024 000 0000"),
                const MomoCardWidget(
                    name: "Vodafone Cash", exampleNumber: "eg : 020 000 0000"),
                const MomoCardWidget(
                    name: "MTN MOMO", exampleNumber: "eg : 026 000 0000"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
