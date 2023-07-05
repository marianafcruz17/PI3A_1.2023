import 'package:flutter/material.dart';
import 'package:marmita_social/src/feature/home/view/page/navigator-page.component.dart';
import 'package:marmita_social/src/feature/home/view/widget/home.dart';

import '../widget/settings.dart';
import 'dialogflow.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _pageIndex,
          children: const <Widget>[
            NavigatorPage(
              title: Text('Marmita Social'),
              child: UserHome(),
            ),
            NavigatorPage(
              title: Text('Search'),
              child: DialogFlow(),
            ),
            NavigatorPage(
              title: Text('Settings'),
              child: Settings(),
              //child: SignupScreen(),
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
