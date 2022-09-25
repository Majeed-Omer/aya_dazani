import 'package:aya_dazani/Screens/Favorite_Screen.dart';
import 'package:aya_dazani/Screens/Informations_Screen.dart';
import 'package:flutter/material.dart';

class bottom extends StatefulWidget {

  @override
  State<bottom> createState() => _bottomState();
}

class _bottomState extends State<bottom> {
  
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[

    Informations_Screen(),
    Favorite_Screen()
    
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
      elevation: 0.0,
      backgroundColor: Color.fromARGB(255, 242, 160, 65),
      title: const Text(
        "ئایا دەزانی؟",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromARGB(255, 241, 145, 36),
          onTap: _onItemTapped,
      ),
    );
  }
}