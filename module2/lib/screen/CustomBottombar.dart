import 'package:flutter/material.dart';

class CustomBottom extends StatefulWidget {
  const CustomBottom({super.key});

  @override
  State<CustomBottom> createState() => _CustomBottomState();
}

class _CustomBottomState extends State<CustomBottom> {
  int selectedindex = 0;
  void _onTapped(int index) {
    setState(() {
      selectedindex = index;
    });

    print(selectedindex);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BottomNavigationBar(
          currentIndex: selectedindex,
          onTap: _onTapped,
          // elevation: 10,
          backgroundColor: Colors.white,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          selectedItemColor: Colors.orangeAccent,
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
              icon: Icon(Icons.add_location_alt_sharp),
              label: "Plan",
              activeIcon: Icon(Icons.add_location_alt_outlined),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.explore_outlined), label: "Explore")
          ]),
    );
  }
}