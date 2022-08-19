import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class TripTicketPage extends StatelessWidget {
  const TripTicketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: veppoBlue,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(52),
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 32, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      'Booking details',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Total \$49,00',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin:const  EdgeInsets.fromLTRB(0, 0, 0, 32),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding:const  EdgeInsets.all(26),
                margin: const EdgeInsets.fromLTRB(26, 26, 26, 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 4,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/images/bus1.png',
                          ),
                        ),
                        const SizedBox(height: 28),
                        const Text(
                          'VVIP',
                          style: TextStyle(
                            fontSize: 32,
                          ),
                        ),
                        const SizedBox(height: 28),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.location_on_outlined, color: Colors.redAccent,),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: const [
                                              Text('From',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontFamily: 'Poppins-Regular',
                                                    fontSize: 14),),
                                              Text('Kumasi',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Poppins-Medium',
                                                    fontSize: 14),),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],),
                                const SizedBox(height: 20,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                         const Icon(Icons.location_on, color: Colors.green,),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: const [
                                              Text('To',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontFamily: 'Poppins-Regular',
                                                    fontSize: 14),),
                                              Text('Achimota',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Poppins-Medium',
                                                    fontSize: 14),),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],),
                              ],
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: const Color(0xFFE4EDF0),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Image.asset('assets/pngs/updown.png',color: const Color(0xFF005248), height: 10,width: 10,),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    const Divider(),
                    const SizedBox(height: 28),
                    Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Passenger',
                                  style: TextStyle(color: veppoLightGrey),
                                ),
                                Text(
                                  'Jane Doe',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                          ],
                        ),
                        const SizedBox(height: 28),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Gate',
                                  style: TextStyle(color: veppoLightGrey),
                                ),
                                Text(
                                  '2H',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Seat',
                                  style: TextStyle(color: veppoLightGrey),
                                ),
                                Text(
                                  '11B',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            const Spacer(flex: 2),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    const Divider(),
                    const SizedBox(height: 28),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          'barccodebarcodeb',
                          style: TextStyle(
                            fontFamily: 'Barcode',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'ticket ID: 18128239487912',
                style: TextStyle(
                  color: veppoLightGrey,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
