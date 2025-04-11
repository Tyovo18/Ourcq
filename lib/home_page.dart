import 'package:flutter/material.dart';
import 'agendascreen.dart';
import 'mapscreen.dart';
import 'homescreen.dart';
import 'qrcodescreen.dart';
import 'profil.dart';
import 'pagestrophees.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _screenToDisplay = <Widget>[
    HomeScreen(),
    AgendaScreen(),
    MapScreen(),
    QRCodeScreen(),
    BadgePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/logo-ver.png', height: 40),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            tooltip: 'Comment Icon',
            onPressed: () {
              // Notifications logic here if necessary
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilPage(),
                  ),
                );
              },
              child: CircleAvatar(
                radius: 20, // Adjust the radius as needed
                backgroundImage: AssetImage('assets/profil.png'), // Replace with your image asset
              ),
            ),
          ),
        ],
      ),
      body: _screenToDisplay[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_awesome_sharp),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 255, 255, 255), // Change selected color
        unselectedItemColor: const Color(0xFF9E9E9E), // Change unselected color
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Ensures no extra spacing
        backgroundColor: const Color.fromRGBO(37, 52, 109, 1), // Change this to any color you want for the background
      ),
    );
  }
}
