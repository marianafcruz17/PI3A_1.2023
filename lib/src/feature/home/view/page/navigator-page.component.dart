import 'package:flutter/material.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({super.key, this.title, required this.child});

  final Widget? title;
  final Widget child;

  @override
  NavigatorPageState createState() => NavigatorPageState();
}

class NavigatorPageState extends State<NavigatorPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: widget.title,
                centerTitle: true,
                backgroundColor: const Color.fromARGB(255, 58, 152, 185),
              ),
              body: widget.child,
            );
          });
    });
  }
}
