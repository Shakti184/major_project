
import 'package:flutter/material.dart';
class Navigationdrawer extends StatelessWidget {
  const Navigationdrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shadowColor: Colors.blueAccent,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItem(context),
          ],
        ),
      ),
    );
  }

  buildHeader(BuildContext context) => Container(
        color: Colors.blue.shade800,
        padding: EdgeInsets.only(
          top: 24 + MediaQuery.of(context).padding.top,
          bottom: 24,
        ),
        child: const Column(
          children: [
            CircleAvatar(
              radius: 52,
              backgroundImage: ExactAssetImage('assets/img1.jpg'),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Plant Doctor',
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            Text(
              'P_Doc123@gmail.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
  buildMenuItem(BuildContext context) => Container(
        padding: const EdgeInsets.all(25),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(
                Icons.home_max_rounded,
                color: Colors.black,
              ),
              title: const Text(
                'Home',
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.notifications_active_outlined,
                color: Colors.black,
              ),
              title: const Text('Notifications'),
              onTap: () {},
            ),
            const Divider(
              color: Colors.black,
            ),
            ListTile(
              leading: const Icon(
                Icons.update,
                color: Colors.black,
              ),
              title: const Text('Update'),
              onTap: () {},
            ),
            // ListTile(
            //   leading: const Icon(Icons.favorite_border,color: Colors.black,),
            //   title: const Text('Favourites'),
            //   onTap: (){},
            // ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.black,
              ),
              title: const Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.info_outline,
                color: Colors.black,
              ),
              title: const Text('About'),
              onTap: () {},
            ),
          ],
        ),
      );
}
