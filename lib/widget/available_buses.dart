import 'package:flutter/material.dart';
import 'package:tech_express_app/Models/bus_type.dart';

class AvailableBuses extends StatelessWidget {
  const AvailableBuses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Available buses",
              style: TextStyle(
                fontFamily: 'Poppins-Bold',
                fontSize: 20,
              ),
            ),
            Row(
              children: const [
                Text(
                  "See all",
                  style: TextStyle(
                    fontFamily: 'Poppins-Regular',
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
        ...BusType.values.map((e) => _AvailableBusCard(busType: e))
      ],
    );
  }
}

class _AvailableBusCard extends StatelessWidget {
  final BusType busType;

  const _AvailableBusCard({super.key, required this.busType});

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        width: _width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    busType.icon,
                    height: 60,
                    width: 60,
                  ),
                ),
                Text(
                  busType.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins-Bold',
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: Colors.redAccent,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'From',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Poppins-Regular',
                                    fontSize: 12),
                              ),
                              Text(
                                'Kumasi',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Poppins-Medium',
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.green,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'To',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Poppins-Regular',
                                    fontSize: 12),
                              ),
                              Text(
                                'Accra',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Poppins-Medium',
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                color: Color(0xFFE4EDF0),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.airplane_ticket_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
