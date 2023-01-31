import 'package:flutter/material.dart';

import 'HomeScreenWidget/HomeScreen.dart';
import 'SecondScreen/searchRoutes.dart';

class CustomNavigation extends StatefulWidget {
  const CustomNavigation({super.key});

  @override
  State<CustomNavigation> createState() => _CustomNavigationState();
}

class _CustomNavigationState extends State<CustomNavigation> {
  var selectedindex = 0;
  static final List<Widget> _screens = [
    const HomeScreen(),
    SearchRoutes(),
    const HomeScreen(),
  ];
  void _onTapped(int index) {
    setState(() {
      selectedindex = index;
    });
    print(selectedindex);
  }

  @override
  Widget build(BuildContext context) {
    print('Build Navigation');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: _screens.elementAt(selectedindex),
      bottomNavigationBar: Card(
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BottomNavigationBar(
              currentIndex: selectedindex,
              onTap: _onTapped,
              // elevation: 10,
              backgroundColor: Colors.white,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              selectedItemColor: Color.fromRGBO(35, 138, 250, 1),
              unselectedItemColor: Colors.black45,
              type: BottomNavigationBarType.fixed,
              iconSize: 30,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.route_rounded),
                    label: "Routs",
                    activeIcon: Icon(
                      Icons.route_outlined,
                    )),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/edit.png'),
                    size: 42,
                  ),
                  label: "Plan",
                  activeIcon: ImageIcon(
                    AssetImage('assets/images/edit.png'),
                    color: Color.fromRGBO(35, 138, 250, 1),
                    size: 42,
                  ),
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.explore_outlined), label: "Explore")
              ]),
        ),
      ),
    );
  }
}
