import 'package:flutter/material.dart';

class ExploreDrawer extends StatelessWidget {
  const ExploreDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(child: Container(
      color: Colors.blueGrey.shade900,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {},
            child: const Text(
              'Login', style: TextStyle(color: Colors.white, fontSize: 22)
            )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Divider(
               color: Colors.blueGrey.shade400,
               thickness: 2,
              )
            ),
          InkWell(
            onTap: () {},
            child: const Text(
              'Sign Up',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Divider(
                color: Colors.blueGrey.shade400,
                thickness: 2,
              )
          ),
          InkWell(
            onTap: () {},
            child: const Text(
              'Discover',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Divider(
                color: Colors.blueGrey.shade400,
                thickness: 2,
              )
          ),
          InkWell(
            onTap: () {},
            child: const Text(
              'Contact Us',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
          Expanded(child: Align(alignment: Alignment.bottomCenter, child: Text(
            'Copyright @ 2022 | Lone Wolf',
            style: TextStyle(
              color: Colors.blueGrey.shade300,
              fontSize: 14
            ),
          )))
        ],
      ),
    ));
  }
}
