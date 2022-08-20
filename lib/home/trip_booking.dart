import 'package:flutter/material.dart';
import 'package:tech_express_app/Models/location.dart';
import 'package:tech_express_app/data/location.dart';
import 'package:tech_express_app/widget/comfort_chip.dart';
import 'package:tech_express_app/widget/location_selection_widget.dart';
import 'package:tech_express_app/widget/location_widget.dart';
import 'package:tech_express_app/widget/time_selection_widget.dart';
import '../utils/constants.dart';
import '../widget/payment_method_widget.dart';

class TripsBooking extends StatefulWidget {
  const TripsBooking({Key? key}) : super(key: key);

  @override
  State<TripsBooking> createState() => _TripsBookingState();
}

class _TripsBookingState extends State<TripsBooking> {
  final bookSeat = TextEditingController();
  int currentBusType = 0;

  double total = 50.0;
  String? fromLocation;
  String? toLocation;
  late DateTime date;
  late List<String> buses;
  String? arrivalDepTime;

  void _onSelectSeat() {
    // showDialog(context: context, builder: (_) => const AlertDialog());
  }

  void _settingModalBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (_) => const PaymentMethodWidget());
  }

  void onComfortChipTapped(value) {
    setState(() {
      currentBusType = value;
      if (currentBusType == 1) {
        total = 30;
      } else if (currentBusType == 2) {
        total = 20.50;
      } else if (currentBusType == 3) {
        total = 35.50;
      } else {
        total = 50.00;
      }
    });
  }

  void _onChangeTime() async {
    String? res = await showModalBottomSheet(
        context: context, builder: (_) => const TimeSelectionWidget());
    if (res == null) return;
    setState(() {
      arrivalDepTime = res;
    });
  }

  @override
  void initState() {
    super.initState();
    date = DateTime.now();
    buses = ['VVIP', 'STC', 'Ford', 'VIP'];
  }

  void _onSelectDate() async {
    DateTime? result = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 20)),
        builder: (ctx, child) {
          return Theme(
            child: child!,
            data: Theme.of(context).copyWith(
                colorScheme:
                    const ColorScheme.light(primary: Color(0xFF005248))),
          );
        });
    if (result == null) return;
    setState(() {
      date = result;
    });
  }

  void ChangePrice() {
    int price = 1;
    setState(() {
      bookSeat.text.isNotEmpty ? price = int.parse(bookSeat.text) : price = 1;
      if (price == 1) {
        total = total;
      } else if (price >= 2 && price <= 3) {
        total = total * 2;
      } else {
        if (price >= 4) {
          total = total * 4;
        }
      }
    });
  }

  Future<void> onChooseLocation(Location location) async {
    if (location == Location.FROM) {
      List<String> data = locationData.toList();
      if (toLocation != null) {
        data.remove(toLocation);
      }
      String? result = await showSearch(
          context: context, delegate: LocationSelection(locations: data));
      if (result == null) return;
      setState(() {
        fromLocation = result;
      });
      return;
    }
    List<String> data = locationData.toList();
    if (fromLocation != null) {
      data.remove(fromLocation);
    }
    String? result = await showSearch(
        context: context, delegate: LocationSelection(locations: data));
    if (result == null) return;
    setState(() {
      toLocation = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 35,
          vertical: 20,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LocationWidget(
                          onTap: onChooseLocation,
                          location: fromLocation,
                          type: Location.FROM),
                      const SizedBox(
                        height: 20,
                      ),
                      LocationWidget(
                          onTap: onChooseLocation,
                          location: toLocation,
                          type: Location.TO),
                    ],
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE4EDF0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      'assets/pngs/updown.png',
                      color: const Color(0xFF005248),
                      height: 10,
                      width: 10,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Divider(
                  thickness: 0.3,
                  color: Colors.grey,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Date",
                        style: TextStyle(
                            fontFamily: 'Poppins-Regular',
                            color: Colors.grey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        date.getDate,
                        style: const TextStyle(
                            fontFamily: 'Poppins-Regular',
                            color: Colors.black,
                            fontSize: 18),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: _onSelectDate,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE4EDF0),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(
                        'assets/pngs/cal.png',
                        color: const Color(0xFF005248),
                        height: 10,
                        width: 10,
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Divider(
                  thickness: 0.3,
                  color: Colors.grey,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Arrival - Departure time",
                        style: TextStyle(
                            fontFamily: 'Poppins-Regular',
                            color: Colors.grey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        arrivalDepTime ?? 'Please select a time',
                        style: const TextStyle(
                            fontFamily: 'Poppins-Regular',
                            color: Colors.black,
                            fontSize: 18),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: _onChangeTime,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE4EDF0),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(
                        'assets/pngs/clock.png',
                        color: const Color(0xFF005248),
                        height: 10,
                        width: 10,
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Divider(
                  thickness: 0.3,
                  color: Colors.grey,
                ),
              ),
              const Text(
                "Choose comfort",
                style: TextStyle(
                    fontFamily: 'Poppins-Regular',
                    color: Colors.grey,
                    fontSize: 13),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                child: SizedBox(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: buses
                          .asMap()
                          .entries
                          .map((e) => ComfortChip(
                              currentIndex: currentBusType,
                              index: e.key,
                              fn: () => onComfortChipTapped(e.key),
                              name: e.value))
                          .toList()),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Divider(
                  thickness: 0.3,
                  color: Colors.grey,
                ),
              ),
              const Text(
                "Select you seat",
                style: TextStyle(
                    fontFamily: 'Poppins-Regular',
                    color: Colors.grey,
                    fontSize: 13),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextFormField(
                          controller: bookSeat,
                          textInputAction: TextInputAction.none,
                          keyboardType: TextInputType.number,
                          onEditingComplete: () => ChangePrice(),
                          decoration: const InputDecoration(
                            hintText: "No seat selected",
                            hintStyle: TextStyle(
                              color: Colors.black26,
                              fontSize: 16,
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: _onSelectSeat,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE4EDF0),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(
                        'assets/pngs/seat.png',
                        color: const Color(0xFF005248),
                        height: 10,
                        width: 10,
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Divider(
                  thickness: 0.3,
                  color: Colors.grey,
                ),
              ),
              Container(
                height: 100,
                width: _width,
                decoration: const BoxDecoration(
                  color: Color(0xFFE4EDF0),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/pngs/qr.png'),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Ticket price",
                              style: TextStyle(
                                  fontFamily: 'Poppins-Regular',
                                  color: Colors.black,
                                  fontSize: 18),
                            ),
                            Text(
                              "GHS $total",
                              style: const TextStyle(
                                  fontFamily: 'Poppins-Bold',
                                  color: Colors.black,
                                  fontSize: 22),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
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
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 35),
                child: GestureDetector(
                  onTap: _settingModalBottomSheet,
                  child: Container(
                    height: 48,
                    width: 230,
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
      ),
    );
  }
}

extension on DateTime {
  String get getDate => '$day/${month < 10 ? '0$month' : month}/$year';
}
