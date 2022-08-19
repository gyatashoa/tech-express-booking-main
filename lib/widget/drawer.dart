import 'package:flutter/material.dart';
import 'package:tech_express_app/utils/constants.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    return Drawer(
      child: Column(children: [
        const UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            foregroundImage: AssetImage('assets/images/pic.jpg'),
          ),
          accountName: Text('Eugene Oppong'),
          accountEmail: Text('email@gmail.com'),
          decoration: BoxDecoration(color: lightGreen),
        ),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text(
            'Check Profile',
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.history),
          title: const Text(
            'History',
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text(
            'Logout',
          ),
          onTap: () {},
        ),
      ]),
    );
  }
}
