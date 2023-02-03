import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constant.dart';
import 'BookmarksScreen.dart';
import 'ExploreScreen.dart';
import 'HomeScreen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _selectedIndex = 0;
  List pages = [
    HomeScreen(),
    BookmarksScreen(),
    ExploreScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              label: "",
              icon: SvgPicture.asset(HomeDisable),
              activeIcon: SvgPicture.asset(HomeActive)),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(StateDisable),
            activeIcon: SvgPicture.asset(StateActive),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(bookDisable),
            activeIcon: SvgPicture.asset(bookActive),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        // selectedItemColor: Colors.lightGreen,
        onTap: _onItemTapped,
        elevation: 1,
        backgroundColor: Colors.white,
        iconSize: 25,

        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
