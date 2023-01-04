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
    );
  }
}
