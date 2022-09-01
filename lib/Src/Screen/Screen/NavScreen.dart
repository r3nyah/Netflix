import 'package:flutter/material.dart';
import 'package:netflix_clone/Src/Screen/Screen/Home.dart';
import 'package:netflix_clone/Src/Screen/Widget/Responsiveness.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _currentIndex = 0;

  final List<Widget> _screen = const [
    Home(
      key: PageStorageKey('Homescreen'),
    ),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final Map<String,IconData> _list = {
    'Home': Icons.home,
    'Search': Icons.search,
    'Coming Soon': Icons.queue_play_next,
    'Download': Icons.file_download,
    'More': Icons.menu,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_currentIndex],
      bottomNavigationBar: !Responsive.isDesktop(context)
          ? BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Colors.transparent,
        items: _list
            .map(
              (title, icon) => MapEntry(
            title,
            BottomNavigationBarItem(
              label: title,
              icon: Icon(icon),
            ),
          ),
        )
            .values
            .toList(),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: (value) => setState(() {
          _currentIndex = value;
        }),
      )
          : null,
    );
  }
}