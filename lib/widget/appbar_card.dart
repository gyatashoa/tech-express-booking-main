import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class TicketAppBar extends StatelessWidget {
  const TicketAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 35,
          width: 35,
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
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.white,width:2),
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage('assets/images/pic.jpg'), fit: BoxFit.cover)
          ),
        ),
      ],
    );
  }
}
