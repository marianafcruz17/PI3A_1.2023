import 'package:flutter/material.dart';
import 'package:marmita_social/src/feature/auth/presentation/view/page/signup_page.dart';
import 'package:marmita_social/src/feature/home/view/page/navigator-page.component.dart';
import 'package:marmita_social/src/feature/home/view/widget/account.dart';
import 'package:marmita_social/src/feature/home/view/widget/home.dart';
import 'package:marmita_social/src/feature/home/view/widget/maps.dart';

import 'dialogflow.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _pageIndex,
          children: <Widget>[
            NavigatorPage(
              title: const Text('Marmita Social'),
              child: const UserHome(),
            ),
            NavigatorPage(
              title: const Text('Search'),
              child: const DialogFlow(),
            ),
            NavigatorPage(
              title: const Text('Settings'),
              child: const SignupScreen(),
            ),
            NavigatorPage(
              title: const Text('Account'),
              child: const Maps(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 58, 152, 185),
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.speaker_notes_outlined),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Account',
          ),
        ],
        currentIndex: _pageIndex,
        onTap: (int index) {
          setState(
            () {
              _pageIndex = index;
            },
          );
        },
      ),
    );
  }
}
