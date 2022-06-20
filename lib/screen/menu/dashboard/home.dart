import 'package:flutter/material.dart';
import 'package:ikhsanproject/screen/menu/dashboard/ListMenu/tabs_screen_menu.dart';
import 'package:ikhsanproject/screen/menu/dashboard/Slider/slidermenu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 260, child: SliderMenu()),
              SizedBox(
                height: 500,
                child: TabsScreenMenu(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
