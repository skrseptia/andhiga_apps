import 'package:flutter/material.dart';
import 'package:ikhsanproject/screen/menu/dashboard/listmenu.dart';
import 'package:ikhsanproject/screen/menu/dashboard/slidermenu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Angkringan Andhiga'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 300, child: SliderMenu()),
              SizedBox(
                height: 500,
                child: Dashboard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
