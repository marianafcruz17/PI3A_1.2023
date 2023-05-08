import 'package:flutter/material.dart';
import 'package:marmita_social/src/feature/home/view/widget/account.dart';
import 'package:marmita_social/src/feature/home/view/widget/chat.dart';
import 'package:marmita_social/src/feature/home/view/widget/home.dart';

import '../../../auth/presentation/view/page/signup_page.dart';

class Restaurantes extends StatefulWidget {
  //StatelessWidget
  const Restaurantes({super.key});

  @override
  State<Restaurantes> createState() => _HomePageState();
}

class _HomePageState extends State<Restaurantes> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    UserHome(),
    SignupScreen(),
    //UserConfig(),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          TextButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/assets/images/localização.png',
                  width: 30,
                  height: 30,
                ),
                const SizedBox(width: 15),
                const Text('Restaurante 1'),
              ],
            ),
          ),
          const SizedBox(height: 15),
          TextButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/assets/images/localização.png',
                  width: 30,
                  height: 30,
                ),
                const SizedBox(width: 15),
                const Text('Restaurante 2'),
              ],
            ),
          ),
          const SizedBox(height: 15),
          TextButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/assets/images/localização.png',
                  width: 30,
                  height: 30,
                ),
                const SizedBox(width: 15),
                const Text('Restaurante 3'),
              ],
            ),
          ),
          const SizedBox(height: 15),
          TextButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/assets/images/localização.png',
                  width: 30,
                  height: 30,
                ),
                const SizedBox(width: 15),
                const Text('Restaurante 4'),
              ],
            ),
          ),
          const SizedBox(height: 15),
          TextButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/assets/images/localização.png',
                  width: 30,
                  height: 30,
                ),
                const SizedBox(width: 15),
                const Text('Restaurante 5'),
              ],
            ),
          ),
          const SizedBox(height: 15),
          TextButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/assets/images/localização.png',
                  width: 30,
                  height: 30,
                ),
                const SizedBox(width: 15),
                const Text('Restaurante 6'),
              ],
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //     backgroundColor: const Color.fromARGB(255, 58, 152, 185),
      //     currentIndex: _selectedIndex,
      //     type: BottomNavigationBarType.fixed,
      //     showSelectedLabels: false,
      //     showUnselectedLabels: false,
      //     onTap: _navigateBottomNavBar,
      //     items: const [
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.home), label: 'Home'),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.speaker_notes_outlined), label: 'Search'),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.settings), label: 'Post'),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.account_circle_outlined), label: 'Account'),
      //     ],
      //   ),
    );
  }
}
