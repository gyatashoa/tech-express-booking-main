import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tech_express_app/Models/bus_type.dart';
import 'package:tech_express_app/Models/location.dart';
import 'package:tech_express_app/data/location.dart';
import 'package:tech_express_app/utils/seat_check_utils.dart';
import 'package:tech_express_app/widget/comfort_chip.dart';
import 'package:tech_express_app/widget/location_selection_widget.dart';
import 'package:tech_express_app/widget/location_widget.dart';
import 'package:tech_express_app/widget/ticket_price_widget.dart';
import 'package:tech_express_app/widget/time_selection_widget.dart';
import '../utils/constants.dart';
import '../widget/payment_method_widget.dart';
import '../widget/purchase_btn.dart';

class TripsBooking extends StatefulWidget {
  const TripsBooking({Key? key}) : super(key: key);

  @override
  State<TripsBooking> createState() => _TripsBookingState();
}

class _TripsBookingState extends State<TripsBooking> {
  late TextEditingController bookSeat;
  late BusType currentBusType;

  double total = 50.0;
  String? fromLocation;
  String? toLocation;
  late DateTime date;
  late List<BusType> buses;
  String? arrivalDepTime;
  bool? _isSeatAvailable;
  late bool _isCheckingSeat;

  void _settingModalBottomSheet() {
    String? res = checkForm();
    if (res == null) {
      showModalBottomSheet(
          context: context, builder: (_) => const PaymentMethodWidget());
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(
      children: [
        const Icon(
          Icons.error,
          color: Colors.red,
        ),
        Text(res)
      ],
    )));
  }

  String? checkForm() {
    if (fromLocation == null) return 'Please provide your location';
    if (toLocation == null) return 'Please provide your destination';
    if (arrivalDepTime == null) {
      return 'Please provide an arrival-departure time';
    }
    if (_isSeatAvailable == null || !(_isSeatAvailable!)) {
      return 'Please provide a valid seat number';
    }
    if (_isCheckingSeat) return 'Please wait while we check seat availability';
    return null;
  }

  void onComfortChipTapped(BusType value) {
    setState(() {
      currentBusType = value;
      if (currentBusType == BusType.VIP) {
        total = 30;
      } else if (currentBusType == BusType.STC) {
        total = 20.50;
      } else if (currentBusType == BusType.FORD) {
        total = 35.50;
      } else {
        total = 50.00;
      }
    });
    _onSeatValueChanged(bookSeat.text);
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
    buses = BusType.values;
    currentBusType = buses.first;
    bookSeat = TextEditingController(text: '');
    _isCheckingSeat = false;
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

  void changePrice() {
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

  String? checkForSeatValidity(String value) {
    int? res = int.tryParse(value);
    if (res == null) return 'Please enter a number';
    if (res < 1) return 'Enter a valid seat number';
    if (res > currentBusType.maxCapacity) return 'Seat number out of range';
    return null;
  }

  Future<bool> checkSeatAvailablity() async {
    return Future.delayed(const Duration(seconds: 5), () => true);
  }

  _onSeatValueChanged(String value) async {
    String? res = checkForSeatValidity(value);
    if (res != null) {
      setState(() {
        _isSeatAvailable = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: const Duration(seconds: 1),
          content: Row(
            children: [
              const Icon(
                Icons.error,
                color: Colors.red,
              ),
              Text(res)
            ],
          )));
      return;
    }
    setState(() {
      _isCheckingSeat = true;
    });
    _isSeatAvailable = await checkSeatAvailablity();
    setState(() {
      _isCheckingSeat = false;
    });
    if (!(_isSeatAvailable!)) {
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: const Duration(seconds: 1),
          content: Row(
            children: const [
              Icon(
                Icons.error,
                color: Colors.red,
              ),
              Text('Seat has already been taken')
            ],
          )));
    }
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 1),
        content: Row(
          children: const [
            Icon(
              Icons.error,
              color: Colors.green,
            ),
            Text('Seat number is available')
          ],
        )));
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
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
                                currentIndex: currentBusType.index,
                                index: e.key,
                                fn: () => onComfortChipTapped(e.value),
                                name: e.value.name))
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
                            onChanged: _onSeatValueChanged,
                            onEditingComplete: () => changePrice(),
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
                    Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE4EDF0),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SeatCheckWidget(
                            isLoading: _isCheckingSeat,
                            isSeatAvailable: _isSeatAvailable)),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    thickness: 0.3,
                    color: Colors.grey,
                  ),
                ),
                TicketPriceWidget(total: total),
                PurchaseBtn(
                  callback: _settingModalBottomSheet,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

extension on DateTime {
  String get getDate => '$day/${month < 10 ? '0$month' : month}/$year';
}
