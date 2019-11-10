

import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key key,
  }) : super(key: key);

  _onBottomBarAction(index) async {
    if (index == 0) {
    //  Navigator.pop(context);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
    icon: Icon(Icons.arrow_back),
    title: Text('Erase Cart & goto Home'),
        ),
        BottomNavigationBarItem(
    icon: Icon(Icons.shopping_basket),
    title: Text('Goto Cart'),
        )
      ], fixedColor: Colors.amber[800], onTap: _onBottomBarAction);
  }
}

/*import 'package:flutter/material.dart';
import 'package:gali_shops/screens/landing/landing_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({
    Key key,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BottomNavigationState();
  }
}

class BottomNavigationState extends State<BottomNavigation> {
  _onBottomBarAction(index) async {
    if (index == 0) {
      // Navigator.of(context).popUntil(ModalRoute.withName("/"));
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => (LandingPage())),
      // );
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.arrow_back),
        title: Text('Erase Cart & goto Home'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_basket),
        title: Text('Goto Cart'),
      )
    ], fixedColor: Colors.amber[800], onTap: _onBottomBarAction);
  }
}
*/