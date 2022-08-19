import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tech_express_app/utils/constants.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

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
                                builder: (_) => const CompletePayment(),
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
  const MomoCardPayment({Key? key}) : super(key: key);

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
                const Text(
                  "Total: Ghs 23.00",
                  style: TextStyle(
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
                momoCard(context, "MTN MOMO", "eg : +233 24 000 0000"),
                momoCard(context, "Vodafone Cash", "eg : +233 20 000 0000"),
                momoCard(context, "AirtelTogo Cash", "eg : +233 26 000 0000"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding momoCard(BuildContext context, String name, exmpNumber) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 5.9,
        child: ExpansionTile(
          textColor: Colors.black,
          title: Text(name),
          leading: null,
          childrenPadding: const EdgeInsets.all(10.0),
          children: [
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                controller: numberField,
                textInputAction: TextInputAction.none,
                keyboardType: TextInputType.phone,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: exmpNumber,
                  hintStyle: const TextStyle(
                    color: Colors.black26,
                    fontSize: 16,
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: GestureDetector(
                onTap: () => showMydialog(context, context),
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

  showMydialog(context, builder) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Enter your pin'),
            content: Form(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  optCodeField(context),
                  optCodeField(context),
                  optCodeField(context),
                  optCodeField(context),
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
        });
  }

  Container optCodeField(BuildContext context) {
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
