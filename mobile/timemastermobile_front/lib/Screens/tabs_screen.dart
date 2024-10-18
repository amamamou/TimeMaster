import 'package:flutter/material.dart';
import 'package:timemastermobile_front/Screens/dashbord_page_screen.dart';

import 'schedule_screen.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  void _selecteScreenFromTabBar(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  int _selectedScreenIndex = 0;

  final List<Widget> _screens = [DashbordPageScreen(), ScheduleScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("data"),
      // ),
      body: _screens[_selectedScreenIndex],

      bottomNavigationBar: BottomNavigationBar(
          onTap: _selecteScreenFromTabBar,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.red[900],
          unselectedItemColor: Colors.white,
          currentIndex: _selectedScreenIndex, //ta3ref anaho el tab el manzoul
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), label: 'Dashboard'),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_time), label: 'schedule'),
          ]),
    );
  }
}
