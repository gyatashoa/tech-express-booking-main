import 'package:flutter/material.dart';
import 'package:tech_express_app/Models/location.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget(
      {Key? key,
      required this.location,
      required this.onTap,
      required this.type})
      : super(key: key);
  final Location type;
  final String? location;
  final Future<void> Function(Location type) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(type),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                type == Location.FROM
                    ? Icons.location_on_outlined
                    : Icons.location_on,
                color: type == Location.FROM ? Colors.redAccent : Colors.green,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      type.name,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Poppins-Regular',
                          fontSize: 14),
                    ),
                    Text(
                      location ?? 'Please tap here to select a location',
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins-Medium',
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
