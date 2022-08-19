import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:tech_express_app/home/mainpage.dart';
import 'package:tech_express_app/home/trip_booking.dart';
import 'package:tech_express_app/home/trips/trip_ticket_page.dart';
import 'package:tech_express_app/utils/constants.dart';
import 'package:tech_express_app/widget/appbar_card.dart';
import 'package:tech_express_app/widget/drawer.dart';
import 'package:unicons/unicons.dart';

import 'boughtTickets.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: const TicketAppBar(),
      drawer: const UserDrawer(),
      body: TabBarView(
        children: const [
          Mainpage(),
          TripsBooking(),
          BoughtTickets(),
        ],
        // If you want to disable swiping in tab the use below code
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 25),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(50.0),
          ),
          child: Container(
            height: 70,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color(0xFF44A8E0), blurRadius: 4, spreadRadius: 1),
              ],
            ),
            child: TabBar(
              labelColor: const Color(0xFFC41A3B),
              unselectedLabelColor: Colors.white,
              labelStyle: const TextStyle(fontSize: 10.0),
              indicator: DotIndicator(
                color: deepGreen,
                distanceFromCenter: 16,
                radius: 3,
                paintingStyle: PaintingStyle.fill,
              ),
              //For Indicator Show and Customization
              indicatorColor: Colors.black54,
              tabs: const [
                Tab(
                  icon: Icon(
                    UniconsLine.home,
                    size: 24.0,
                    color: Colors.grey,
                  ),
                ),
                Tab(
                  icon: Icon(
                    UniconsLine.ticket,
                    size: 24.0,
                    color: Colors.grey,
                  ),
                ),
                Tab(
                  icon: Icon(
                    UniconsLine.car,
                    size: 24.0,
                    color: Colors.grey,
                  ),
                ),
              ],
              controller: _tabController,
            ),
          ),
        ),
      ),
    );
  }
}
