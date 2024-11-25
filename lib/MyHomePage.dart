import 'package:flutter/material.dart';
import 'profile page.dart';
import 'welcome.dart';
import 'SearchScreen.dart';
import 'NotificationScreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHomePage(title: 'Shopping Platforms'),
  ));
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    SearchScreen(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToNotificationScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NotificationScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: _navigateToNotificationScreen,
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}