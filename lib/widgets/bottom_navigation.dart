import 'dart:io';
import 'package:bardimannn/data/data_sources/auth_local_datasource.dart';
import 'package:bardimannn/theme/theme.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  static String routeName = "/bottomnavigation";
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedNavbar = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Text("1"),
    Text("2"),
    Text("3"),
    Text("4"),
    // HomeScreen(),
    // TrendScreen(),
    // TicketScreen(isBotNav: true),
    // ProfileScreen(),
  ];

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  void onBack() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Warning'),
        content: Text('Do you really want to exit'),
        actions: [
          TextButton(
            child: Text('No'),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: Text('Yes'),
            onPressed: () => exit(1),
          ),
        ],
      ),
    );
  }

  Future<void> getAuthData() async {
    final authData = await AuthLocalDatasources().getAuthData();
    print(authData.username);
  }

  @override
  void initState() {
    getAuthData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        onBack();
        return false;
      },
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedNavbar),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedLabelStyle: Fonts.txt12medium,
          selectedLabelStyle: Fonts.txt12medium,
          currentIndex: _selectedNavbar,
          iconSize: 24,
          backgroundColor: White,
          selectedItemColor: AY600,
          unselectedItemColor: Grey,
          onTap: _changeSelectedNavBar,
          items: <BottomNavigationBarItem>[
            navItem('assets/icons/home.png', "Home"),
            navItem('assets/icons/news.png', "Trend"),
            navItem('assets/icons/ticket.png', "Ticket"),
            navItem('assets/icons/profile.png', 'Profile')
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem navItem(String icon, String label) {
    return BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage(icon),
      ),
      label: label,
    );
  }
}
