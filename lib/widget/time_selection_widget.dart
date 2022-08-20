import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_express_app/data/arrival_departure_data.dart';

class TimeSelectionWidget extends StatefulWidget {
  const TimeSelectionWidget({Key? key}) : super(key: key);

  @override
  State<TimeSelectionWidget> createState() => _TimeSelectionWidgetState();
}

class _TimeSelectionWidgetState extends State<TimeSelectionWidget> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .35,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () => Navigator.pop(
                      context, arrivalDepartureData[_currentIndex]),
                  style: TextButton.styleFrom(
                      textStyle: const TextStyle(color: Colors.blue)),
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Colors.blue),
                  )),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                      textStyle: const TextStyle(color: Colors.blue)),
                  child: const Text(
                    'CANCEL',
                    style: TextStyle(color: Colors.blue),
                  )),
            ],
          ),
          Expanded(
            child: CupertinoPicker(
              squeeze: 1,
              itemExtent: 40,
              magnification: 1.1,
              useMagnifier: true,
              onSelectedItemChanged: (int value) => _currentIndex = value,
              children: arrivalDepartureData
                  .map((e) => Center(child: Text(e)))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
