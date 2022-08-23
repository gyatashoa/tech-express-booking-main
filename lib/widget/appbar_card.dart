import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_express_app/home/homepage.dart';

import '../utils/constants.dart';

class TicketAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TicketAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Icon(
                      CupertinoIcons.slider_horizontal_3,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  //TODO: implement profile screen navigation here
                  print('will open user profile');
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white, width: 2),
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                          image: AssetImage('assets/pngs/user.png'),
                          fit: BoxFit.cover)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(20, 65);
}
