import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tech_express_app/authentication/login_page.dart';
import 'package:tech_express_app/authentication/userCredential.dart';
import 'package:tech_express_app/utils/constants.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    User? user = FirebaseAuth.instance.currentUser;
    return Drawer(
      child: Column(children: [
        UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            child: Text(
              //TODO : will implement a memoji in place of using a text
              user?.displayName?.substring(0, 1) ?? '',
              style: const TextStyle(fontSize: 24),
            ),
          ),
          accountName: Text(user?.displayName ?? ''),
          accountEmail: Text(user?.email ?? ''),
          decoration: const BoxDecoration(color: lightGreen),
        ),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text(
            'Check Profile',
          ),
          onTap: () {},
        ),
        // ListTile(
        //   leading: const Icon(Icons.history),
        //   title: const Text(
        //     'History',
        //   ),
        //   onTap: () {},
        // ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text(
            'Logout',
          ),
          onTap: () {
            Auth.signout().then((_) => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (__) => const LoginPage()),
                (route) => false));
            ;
          },
        ),
      ]),
    );
  }
}
