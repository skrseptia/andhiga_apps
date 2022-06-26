import 'package:flutter/material.dart';
import 'package:ikhsanproject/screen/menu/dashboard/ListMenu/listMenuCategory/listmenu_makanan.dart';
import 'package:ikhsanproject/screen/menu/dashboard/ListMenu/listMenuCategory/listmenu_minuman.dart';
import 'package:ikhsanproject/screen/menu/dashboard/ListMenu/listMenuCategory/listmenu_semua.dart';

class TabsScreenMenu extends StatefulWidget {
  const TabsScreenMenu({Key? key}) : super(key: key);
  static const routeName = '/TabsScreenMenu';

  @override
  State<TabsScreenMenu> createState() => _TabsScreenMenuState();
}

class _TabsScreenMenuState extends State<TabsScreenMenu>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late int _activeTabIndex;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(_setActiveTabIndex);

    super.initState();
  }

  void _setActiveTabIndex() {
    _activeTabIndex = _tabController.index;
  }


  @override
  Widget build(BuildContext context) {
  debugPrint("Active tab $_activeTabIndex");
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: TextField(
            onTap: () {},
            readOnly: true,
            style: TextStyle(fontSize: 12),
            decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white),
                ),
                fillColor: Colors.white,
                filled: true),
          ),
          bottom: TabBar(
            labelColor: Colors.blue,
            controller: _tabController,
            tabs: [
              Tab(text: 'Semua'),
              Tab(text: 'Makanan'),
              Tab(text: 'Minuman'),
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [
            ListMenuSemua(),
            FoodList(),
            BeverageList(),
          ],
        ));
  }
}
