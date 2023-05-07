
import 'package:flutter/material.dart';
import 'package:marmita_social/src/feature/home/view/widget/chat.dart';
import 'package:marmita_social/src/feature/home/view/widget/config.dart';

import '../widget/account.dart';
import '../widget/home.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    UserHome(),
    UserConfig(),
    Chat(),
    UserAccount(),
  ];

  void _navigateBottomNavBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marmita Social'),
        actions: [
          IconButton(
            icon: Image.asset(
              'lib/assets/images/picwish1.png' , 
              height: 116, width: 70,
            ),
            onPressed: () {
            },
          ),
        ],
        backgroundColor: Color.fromARGB(255, 58, 152, 185),
           
      ),
      backgroundColor: Colors.blue,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 58, 152, 185),
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _navigateBottomNavBar,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.speaker_notes_outlined), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Post'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: 'Account'),
        ],
      ),
    );
  }
}
