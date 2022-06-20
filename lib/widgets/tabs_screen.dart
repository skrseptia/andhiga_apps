import 'package:flutter/material.dart';
import 'package:ikhsanproject/screen/menu/dashboard/home.dart';
import '../screen/menu/account.dart';

import '../screen/menu/transaksi.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/home';

  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages = [];

  int _selectedPageIndex = 0;
  @override
  void initState() {
    _pages = [
      {
        'page': HomeScreen(),
        'title': "HomeScreen",
      },
      {
        'page': Transaksi(),
        'title': "Transaksi",
      },
      {
        'page': Profil(),
        'title': "Profil",
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'] as String),
      ),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: const Color.fromARGB(255, 100, 97, 97),
        selectedItemColor: Colors.black,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: const Icon(Icons.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: const Icon(Icons.swap_horiz_sharp),
            label: 'Transaksi',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: const Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
