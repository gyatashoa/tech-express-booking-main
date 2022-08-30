import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tech_express_app/Models/bus_type.dart';
import 'package:tech_express_app/Models/location.dart';
import 'package:tech_express_app/Models/predefined_trip.dart';
import 'package:tech_express_app/Models/status.dart';
import 'package:tech_express_app/Models/ticket_model.dart';
import 'package:tech_express_app/data/location.dart';
import 'package:tech_express_app/service/cloud_firestore_service.dart';
import 'package:tech_express_app/utils/price_computation.dart';
import 'package:tech_express_app/utils/seat_check_utils.dart';
import 'package:tech_express_app/utils/seat_dialog.dart';
import 'package:tech_express_app/utils/show_error_snackbar.dart';
import 'package:tech_express_app/widget/comfort_chip.dart';
import 'package:tech_express_app/widget/location_selection_widget.dart';
import 'package:tech_express_app/widget/location_widget.dart';
import 'package:tech_express_app/widget/ticket_price_widget.dart';
import 'package:tech_express_app/widget/time_selection_widget.dart';
import 'package:uuid/uuid.dart';
import '../utils/constants.dart';
import '../widget/payment_method_widget.dart';
import '../widget/purchase_btn.dart';

class TripsBooking extends StatefulWidget {
  final PredefinedTrip? predefinedTrip;
  const TripsBooking({Key? key, this.predefinedTrip}) : super(key: key);

  @override
  State<TripsBooking> createState() => _TripsBookingState();
}

class _TripsBookingState extends State<TripsBooking> {
  late TextEditingController bookSeat;
  late BusType currentBusType;

  late double total;
  String? fromLocation;
  String? toLocation;
  late DateTime date;
  late List<BusType> buses;
  String? arrivalDepTime;

  void _settingModalBottomSheet() {
    String? res = checkForm();
    if (res == null) {
      final ticket = TicketModel(
          arrivalDepTime: arrivalDepTime!,
          busType: currentBusType,
          createdAt: DateTime.now(),
          date: date,
          from: fromLocation!,
          to: toLocation!,
          id: const Uuid().v4(),
          price: total,
          seatNumber: int.parse(bookSeat.text),
          userId: FirebaseAuth.instance.currentUser!.uid,
          userName: FirebaseAuth.instance.currentUser!.displayName!,
          phoneNumber: FirebaseAuth.instance.currentUser!.photoURL!,
          ticketStatus: TicketStatus.NOT_SCANNED,
          timeScanned: null);
      showModalBottomSheet(
          context: context,
          builder: (_) => PaymentMethodWidget(
                ticketModel: ticket,
              ));
      return;
    }
    showErrorSnackbar(context, res);
  }

  String? checkForm() {
    if (fromLocation == null) return 'Please provide your location';
    if (toLocation == null) return 'Please provide your destination';
    if (arrivalDepTime == null) {
      return 'Please provide an arrival-departure time';
    }
    if (bookSeat.text.isEmpty) {
      return 'Please select a seat number to proceed';
    }
    return null;
  }

  void onComfortChipTapped(BusType value) {
    setState(() {
      currentBusType = value;
    });
    bookSeat.text = '';
  }

  void _onChangeTime() async {
    String? res = await showModalBottomSheet(
        context: context, builder: (_) => const TimeSelectionWidget());
    if (res == null) return;
    bookSeat.text = '';
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
    total = 0;
    if (widget.predefinedTrip != null) {
      toLocation = widget.predefinedTrip?.to;
      fromLocation = widget.predefinedTrip?.from;
      arrivalDepTime = widget.predefinedTrip?.departure;
      currentBusType = widget.predefinedTrip!.type;
      total =
          computePrice(widget.predefinedTrip?.to, widget.predefinedTrip?.from);
    }
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
    bookSeat.text = '';
    setState(() {
      date = result;
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
      bookSeat.text = '';
      setState(() {
        fromLocation = result;
        total = computePrice(toLocation, fromLocation);
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
    bookSeat.text = '';
    setState(() {
      toLocation = result;
      total = computePrice(toLocation, fromLocation);
    });
  }

  void onSelectSeat() async {
    if (toLocation == null) {
      return showErrorSnackbar(context, 'Please selection your location');
    }
    if (fromLocation == null) {
      return showErrorSnackbar(context, 'Please selection your destination');
    }
    if (arrivalDepTime == null) {
      return showErrorSnackbar(context, 'Please selection your arrival time');
    }
    int? res = await showDialog(
        context: context,
        builder: (_) => SeatDialog(
            selectedDate: date,
            to: toLocation!,
            from: fromLocation!,
            busType: currentBusType,
            arrivalTime: arrivalDepTime!));
    if (res == null) return;
    bookSeat.text = res.toString();
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
                            enabled: false,
                            textInputAction: TextInputAction.none,
                            keyboardType: TextInputType.number,
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
                          onTap: onSelectSeat,
                        )),
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
